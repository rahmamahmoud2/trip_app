import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app/features/driver/cubit/driver_cubit.dart';
import 'package:trip_app/features/driver/cubit/driver_state.dart';
import 'package:trip_app/features/driver/models/driver_request_model.dart';

void main() {
  group('DriverCubit Tests', () {
    late DriverCubit cubit;

    setUp(() {
      cubit = DriverCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('Initial state is online, in feed step with mock requests', () {
      expect(cubit.state.isOnline, true);
      expect(cubit.state.step, DriverStep.feed);
      expect(cubit.state.requests.isNotEmpty, true);
      expect(cubit.state.selectedRequest, isNull);
    });

    test('toggleOnline toggles online and offline status', () {
      cubit.toggleOnline(false);
      expect(cubit.state.isOnline, false);
      cubit.toggleOnline(true);
      expect(cubit.state.isOnline, true);
    });

    test('selectRequest sets request and transitions to requestDetails step', () {
      final req = DriverRequestModel.mockRequests.first;
      cubit.selectRequest(req);

      expect(cubit.state.selectedRequest, req);
      expect(cubit.state.step, DriverStep.requestDetails);
      expect(cubit.state.counterFare, 59);
    });

    test('acceptDirectly transitions directly to tripAccepted step', () {
      cubit.acceptDirectly();
      expect(cubit.state.step, DriverStep.tripAccepted);
    });

    test('Custom keypad input and fare manipulation works correctly', () {
      cubit.openCustomFare();
      expect(cubit.state.step, DriverStep.customFare);

      cubit.keypadInput('backspace');
      cubit.keypadInput('backspace');
      expect(cubit.state.fareInputString, '0');

      cubit.keypadInput('7');
      cubit.keypadInput('5');
      expect(cubit.state.fareInputString, '75');
      expect(cubit.state.counterFare, 75);
    });

    test('submitOffer transitions to waitingForReply and passenger acceptance to tripAccepted', () {
      cubit.submitOffer(autoSimulatePassengerAccept: false);
      expect(cubit.state.step, DriverStep.waitingForReply);

      cubit.passengerAcceptsOffer();
      expect(cubit.state.step, DriverStep.tripAccepted);

      cubit.startTrip();
      expect(cubit.state.step, DriverStep.tripStarted);
    });

    test('skipRequest resets to feed and clears selectedRequest', () {
      final req = DriverRequestModel.mockRequests.first;
      cubit.selectRequest(req);
      cubit.skipRequest();

      expect(cubit.state.step, DriverStep.feed);
      expect(cubit.state.selectedRequest, isNull);
    });
  });
}
