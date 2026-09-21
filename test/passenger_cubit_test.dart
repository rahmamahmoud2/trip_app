import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app/features/passenger/cubit/passenger_cubit.dart';
import 'package:trip_app/features/passenger/cubit/passenger_state.dart';
import 'package:trip_app/features/passenger/ride/models/ride_type_model.dart';

void main() {
  group('PassengerCubit Tests', () {
    late PassengerCubit cubit;

    setUp(() {
      cubit = PassengerCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test(
      'Initial state is selectRide with default fare 0 (showing Offer your fare)',
      () {
        expect(cubit.state.bookingStep, PassengerBookingStep.selectRide);
        expect(cubit.state.fare, 0);
        expect(cubit.state.selectedCategory, RideCategory.ride);
      },
    );

    test('Selecting Comfort updates selectedCategory', () {
      cubit.selectCategory(RideCategory.comfort);
      expect(cubit.state.selectedCategory, RideCategory.comfort);
    });

    test('setFare, increaseFare and decreaseFare change the fare value', () {
      cubit.setFare(50);
      expect(cubit.state.fare, 50);

      cubit.increaseFare(5);
      expect(cubit.state.fare, 55);

      cubit.decreaseFare(10);
      expect(cubit.state.fare, 45);
    });

    test(
      'confirmRide transitions from selectRide to routePreview and defaults fare to 50 if 0',
      () {
        cubit.confirmRide();
        expect(cubit.state.bookingStep, PassengerBookingStep.routePreview);
        expect(cubit.state.fare, 50);
      },
    );

    test('findRide transitions to findingDriver', () {
      cubit.findRide();
      expect(cubit.state.bookingStep, PassengerBookingStep.findingDriver);
    });

    test('showOffers transitions to driverOffers', () {
      cubit.showOffers();
      expect(cubit.state.bookingStep, PassengerBookingStep.driverOffers);
      expect(cubit.state.offers.isNotEmpty, true);
    });

    test('cancelRequest resets to selectRide', () {
      cubit.showOffers();
      cubit.cancelRequest();
      expect(cubit.state.bookingStep, PassengerBookingStep.selectRide);
    });
  });
}
