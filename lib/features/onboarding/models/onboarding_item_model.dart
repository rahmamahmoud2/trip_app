import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';

class OnboardingItemModel {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingItemModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  static const List<OnboardingItemModel> pages = [
    OnboardingItemModel(
      title: AppStrings.onboardingTitle1,
      subtitle: AppStrings.onboardingSubtitle1,
      imagePath: AppAssets.onboardingCar1,
    ),
    OnboardingItemModel(
      title: AppStrings.onboardingTitle2,
      subtitle: AppStrings.onboardingSubtitle2,
      imagePath: AppAssets.onboardingCar2,
    ),
    OnboardingItemModel(
      title: AppStrings.onboardingTitle3,
      subtitle: AppStrings.onboardingSubtitle3,
      imagePath: AppAssets.onboardingCar3,
    ),
  ];
}
