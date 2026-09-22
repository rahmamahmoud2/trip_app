import 'package:flutter/material.dart';
import 'package:trip_app/core/widgets/ride_match_card.dart';
import '../models/driver_offer_model.dart';

class DriverOfferCard extends StatelessWidget {
  final DriverOfferModel offer;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const DriverOfferCard({
    super.key,
    required this.offer,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return RideMatchCard(
      name: offer.driverName,
      rating: offer.rating,
      tripsCount: offer.tripsCount,
      subtitle: offer.carModel,
      eta: offer.eta,
      distance: offer.distance,
      fare: offer.fare,
      avatarUrl: offer.avatarUrl,
      onAccept: onAccept,
      onDecline: onDecline,
    );
  }
}
