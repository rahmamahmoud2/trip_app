import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';

class OnboardingItemModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final Alignment imageAlignment;

  const OnboardingItemModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.imageAlignment = Alignment.bottomRight,
  });

  static const List<OnboardingItemModel> pages = [
    OnboardingItemModel(
      title: AppStrings.onboardingTitle1,
      subtitle: AppStrings.onboardingSubtitle1,
      imagePath: AppAssets.onboardingCar1,
      imageAlignment: Alignment.bottomLeft,
    ),
    OnboardingItemModel(
      title: AppStrings.onboardingTitle2,
      subtitle: AppStrings.onboardingSubtitle2,
      imagePath: AppAssets.onboardingCar2,
      imageAlignment: Alignment.bottomRight,
    ),
    OnboardingItemModel(
      title: AppStrings.onboardingTitle3,
      subtitle: AppStrings.onboardingSubtitle3,
      imagePath: AppAssets.onboardingCar3,
      imageAlignment: Alignment.bottomRight,
    ),
  ];
}
