import 'package:trip_app/features/passenger/matching/models/driver_offer_model.dart';

import '../ride/models/ride_type_model.dart';

enum PassengerBookingStep {
  /// Screen 2 & 3: Selecting Ride or Comfort, entering fare, confirming
  selectRide,

  /// Screen 4: Showing route on map, travel time badge, Find a Ride button
  routePreview,

  /// Screen 5: Searching for drivers, ability to raise/lower fare
  findingDriver,

  /// Screen 6: Driver offers received, can accept/decline or cancel
  driverOffers,
}

class PassengerState {
  final PassengerBookingStep bookingStep;
  final RideCategory selectedCategory;
  final int fare;
  final String pickup;
  final String destination;
  final List<DriverOfferModel> offers;

  const PassengerState({
    this.bookingStep = PassengerBookingStep.selectRide,
    this.selectedCategory = RideCategory.ride,
    this.fare = 0,
    this.pickup = 'Mohammed Ezz El-Arab St',
    this.destination = 'Ain Shams Universty',
    this.offers = DriverOfferModel.mockOffers,
  });

  PassengerState copyWith({
    PassengerBookingStep? bookingStep,
    RideCategory? selectedCategory,
    int? fare,
    String? pickup,
    String? destination,
    List<DriverOfferModel>? offers,
  }) {
    return PassengerState(
      bookingStep: bookingStep ?? this.bookingStep,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      fare: fare ?? this.fare,
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      offers: offers ?? this.offers,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassengerState &&
          runtimeType == other.runtimeType &&
          bookingStep == other.bookingStep &&
          selectedCategory == other.selectedCategory &&
          fare == other.fare &&
          pickup == other.pickup &&
          destination == other.destination &&
          offers == other.offers;

  @override
  int get hashCode =>
      bookingStep.hashCode ^
      selectedCategory.hashCode ^
      fare.hashCode ^
      pickup.hashCode ^
      destination.hashCode ^
      offers.hashCode;
}
