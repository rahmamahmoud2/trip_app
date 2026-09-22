import 'package:flutter/material.dart';
import 'package:trip_app/core/widgets/ride_match_card.dart';
import '../../models/driver_request_model.dart';

class DriverRequestOfferCard extends StatelessWidget {
  final DriverRequestModel request;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const DriverRequestOfferCard({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onDecline,
  });

  String get _distanceLabel {
    if (request.distanceKm < 1) {
      return '${(request.distanceKm * 1000).round()} m';
    }
    return '${request.distanceKm.toStringAsFixed(1)} KM';
  }

  @override
  Widget build(BuildContext context) {
    return RideMatchCard(
      name: request.passengerName,
      rating: request.rating,
      tripsCount: request.tripsCount,
      subtitle: request.pickup,
      eta: '${request.etaMinutes} Min',
      distance: _distanceLabel,
      fare: request.offeredFare,
      onAccept: onAccept,
      onDecline: onDecline,
    );
  }
}
