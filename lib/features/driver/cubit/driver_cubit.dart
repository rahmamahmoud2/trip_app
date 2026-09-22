import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/driver_request_model.dart';
import 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(const DriverState());

  Timer? _replyTimer;
  Timer? _offerTimer;
  static const Duration _offerDuration = Duration(seconds: 30);

  @override
  Future<void> close() {
    _replyTimer?.cancel();
    _offerTimer?.cancel();
    return super.close();
  }

  void toggleOnline(bool online) {
    emit(state.copyWith(isOnline: online));
  }

  void selectRequest(DriverRequestModel request) {
    final defaultCounterFare = request.offeredFare + 9;
    _startOfferTimer();
    emit(
      state.copyWith(
        selectedRequest: request,
        counterFare: defaultCounterFare,
        fareInputString: defaultCounterFare.toString(),
        step: DriverStep.requestDetails,
        offerProgress: 0.0,
      ),
    );
  }

  void skipRequest() {
    _replyTimer?.cancel();
    _stopOfferTimer();
    emit(
      state.copyWith(
        step: DriverStep.feed,
        clearSelectedRequest: true,
        offerProgress: 0.0,
      ),
    );
  }

  void acceptCustomerOffer() {
    final offered = state.selectedRequest?.offeredFare ?? 50;
    emit(
      state.copyWith(
        counterFare: offered,
        fareInputString: offered.toString(),
      ),
    );
    submitOffer();
  }

  void acceptDirectly() {
    _replyTimer?.cancel();
    _stopOfferTimer();
    emit(state.copyWith(step: DriverStep.tripAccepted, offerProgress: 1.0));
  }

  void selectQuickFare(int fare) {
    emit(state.copyWith(counterFare: fare, fareInputString: fare.toString()));
  }

  void openCustomFare() {
    emit(state.copyWith(step: DriverStep.customFare));
  }

  void closeCustomFare() {
    emit(state.copyWith(step: DriverStep.requestDetails));
  }

  void keypadInput(String value) {
    String current = state.fareInputString;
    if (value == 'backspace') {
      if (current.isNotEmpty) {
        current = current.substring(0, current.length - 1);
      }
      if (current.isEmpty) {
        current = '0';
      }
    } else {
      if (current == '0') {
        current = value;
      } else if (current.length < 5) {
        current += value;
      }
    }

    final parsed = int.tryParse(current) ?? 0;
    emit(state.copyWith(fareInputString: current, counterFare: parsed));
  }

  void submitOffer({bool autoSimulatePassengerAccept = true}) {
    emit(state.copyWith(step: DriverStep.waitingForReply));

    if (autoSimulatePassengerAccept) {
      _replyTimer?.cancel();
      _replyTimer = Timer(const Duration(seconds: 3), () {
        if (!isClosed && state.step == DriverStep.waitingForReply) {
          _stopOfferTimer();
          emit(state.copyWith(step: DriverStep.tripAccepted, offerProgress: 1.0));
        }
      });
    }
  }

  void passengerAcceptsOffer() {
    _replyTimer?.cancel();
    _stopOfferTimer();
    emit(state.copyWith(step: DriverStep.tripAccepted, offerProgress: 1.0));
  }

  void startTrip() {
    _stopOfferTimer();
    emit(state.copyWith(step: DriverStep.tripStarted, offerProgress: 1.0));
  }

  void resetToFeed() {
    _replyTimer?.cancel();
    _stopOfferTimer();
    emit(
      state.copyWith(
        step: DriverStep.feed,
        clearSelectedRequest: true,
        offerProgress: 0.0,
      ),
    );
  }

  void _startOfferTimer() {
    _offerTimer?.cancel();
    final startedAt = DateTime.now();

    _offerTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      final elapsed = DateTime.now().difference(startedAt);
      final progress =
          (elapsed.inMilliseconds / _offerDuration.inMilliseconds).clamp(0.0, 1.0);

      emit(state.copyWith(offerProgress: progress));

      if (progress >= 1.0) {
        timer.cancel();
        _onOfferTimedOut();
      }
    });
  }

  void _stopOfferTimer() {
    _offerTimer?.cancel();
    _offerTimer = null;
  }

  void _onOfferTimedOut() {
    if (state.step == DriverStep.requestDetails ||
        state.step == DriverStep.customFare ||
        state.step == DriverStep.waitingForReply) {
      skipRequest();
    }
  }
}
