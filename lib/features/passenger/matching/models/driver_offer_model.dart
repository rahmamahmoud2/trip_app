class DriverOfferModel {
  final String id;
  final String driverName;
  final double rating;
  final int tripsCount;
  final String carModel;
  final String eta;
  final String distance;
  final int fare;
  final String? avatarUrl;

  const DriverOfferModel({
    required this.id,
    required this.driverName,
    required this.rating,
    required this.tripsCount,
    required this.carModel,
    required this.eta,
    required this.distance,
    required this.fare,
    this.avatarUrl,
  });

  static const List<DriverOfferModel> mockOffers = [
    DriverOfferModel(
      id: 'offer_1',
      driverName: 'Ahmed',
      rating: 4.8,
      tripsCount: 68,
      carModel: 'Toyota Yaris',
      eta: '5 Min',
      distance: '750 m',
      fare: 55,
    ),
    DriverOfferModel(
      id: 'offer_2',
      driverName: 'Ahmed',
      rating: 4.8,
      tripsCount: 68,
      carModel: 'Toyota Yaris',
      eta: '5 Min',
      distance: '750 m',
      fare: 50,
    ),
  ];
}
