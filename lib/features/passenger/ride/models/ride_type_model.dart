import 'package:trip_app/core/constants/app_assets.dart';
import 'package:trip_app/core/constants/app_strings.dart';

enum RideCategory { ride, comfort }

class RideTypeModel {
  final RideCategory category;
  final String title;
  final String iconPath;
  final int baseFare;

  const RideTypeModel({
    required this.category,
    required this.title,
    required this.iconPath,
    required this.baseFare,
  });

  static const List<RideTypeModel> availableTypes = [
    RideTypeModel(
      category: RideCategory.ride,
      title: AppStrings.ride,
      iconPath: AppAssets.rideCar,
      baseFare: 50,
    ),
    RideTypeModel(
      category: RideCategory.comfort,
      title: AppStrings.comfort,
      iconPath: AppAssets.comfortCar,
      baseFare: 70,
    ),
  ];
}
