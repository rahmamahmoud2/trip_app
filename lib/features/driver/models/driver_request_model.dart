import 'package:trip_app/core/constants/app_strings.dart';

class DriverRequestModel {
  final String id;
  final String passengerName;
  final double rating;
  final int tripsCount;
  final int etaMinutes;
  final String pickup;
  final String dropoff;
  final int displayFare;
  final int offeredFare;
  final double distanceKm;
  final String pickupTime;

  const DriverRequestModel({
    required this.id,
    required this.passengerName,
    required this.rating,
    required this.tripsCount,
    required this.etaMinutes,
    required this.pickup,
    required this.dropoff,
    required this.displayFare,
    required this.offeredFare,
    required this.distanceKm,
    this.pickupTime = '10:00 min.',
  });

  static const List<DriverRequestModel> mockRequests = [
    DriverRequestModel(
      id: 'req_1',
      passengerName: AppStrings.driverProfileName,
      rating: 4.8,
      tripsCount: 130,
      etaMinutes: 5,
      pickup: AppStrings.samplePickupCity,
      dropoff: AppStrings.sampleDropoffAddress,
      displayFare: 30,
      offeredFare: 50,
      distanceKm: 2.1,
    ),
    DriverRequestModel(
      id: 'req_2',
      passengerName: AppStrings.driverProfileName,
      rating: 4.8,
      tripsCount: 130,
      etaMinutes: 5,
      pickup: AppStrings.samplePickupCity,
      dropoff: AppStrings.sampleDropoffAddress,
      displayFare: 30,
      offeredFare: 50,
      distanceKm: 2.1,
    ),
    DriverRequestModel(
      id: 'req_3',
      passengerName: AppStrings.driverProfileName,
      rating: 4.8,
      tripsCount: 130,
      etaMinutes: 5,
      pickup: AppStrings.samplePickupCity,
      dropoff: AppStrings.sampleDropoffAddress,
      displayFare: 30,
      offeredFare: 50,
      distanceKm: 2.1,
    ),
    DriverRequestModel(
      id: 'req_4',
      passengerName: AppStrings.driverProfileName,
      rating: 4.8,
      tripsCount: 130,
      etaMinutes: 5,
      pickup: AppStrings.samplePickupCity,
      dropoff: AppStrings.sampleDropoffAddress,
      displayFare: 30,
      offeredFare: 50,
      distanceKm: 2.1,
    ),
    DriverRequestModel(
      id: 'req_5',
      passengerName: AppStrings.driverProfileName,
      rating: 4.8,
      tripsCount: 130,
      etaMinutes: 5,
      pickup: AppStrings.samplePickupCity,
      dropoff: AppStrings.sampleDropoffAddress,
      displayFare: 30,
      offeredFare: 50,
      distanceKm: 2.1,
    ),
  ];
}
