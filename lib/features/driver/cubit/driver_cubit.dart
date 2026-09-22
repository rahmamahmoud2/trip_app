import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/driver_request_model.dart';
import 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(const DriverState());

  Timer? _replyTimer;

  @override
  Future<void> close() {
    _replyTimer?.cancel();
    return super.close();
  }

  void toggleOnline(bool online) {
    emit(state.copyWith(isOnline: online));
  }

  void selectRequest(DriverRequestModel request) {
    final defaultCounterFare = request.offeredFare + 9;
    emit(
      state.copyWith(
        selectedRequest: request,
        counterFare: defaultCounterFare,
        fareInputString: defaultCounterFare.toString(),
        step: DriverStep.requestDetails,
      ),
    );
  }

  void skipRequest() {
    _replyTimer?.cancel();
    emit(
      state.copyWith(
        step: DriverStep.feed,
        clearSelectedRequest: true,
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
    emit(state.copyWith(step: DriverStep.tripAccepted));
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
          emit(state.copyWith(step: DriverStep.tripAccepted));
        }
      });
    }
  }

  void passengerAcceptsOffer() {
    _replyTimer?.cancel();
    emit(state.copyWith(step: DriverStep.tripAccepted));
  }

  void startTrip() {
    emit(state.copyWith(step: DriverStep.tripStarted));
  }

  void resetToFeed() {
    _replyTimer?.cancel();
    emit(
      state.copyWith(
        step: DriverStep.feed,
        clearSelectedRequest: true,
      ),
    );
  }
}
