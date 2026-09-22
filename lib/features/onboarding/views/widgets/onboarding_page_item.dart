import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../models/onboarding_item_model.dart';
import 'onboarding_spacing.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingItemModel item;
  final bool showSkip;
  final VoidCallback? onSkip;

  const OnboardingPageItem({
    super.key,
    required this.item,
    required this.showSkip,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(height: OnboardingSpacing.topPadding(context)),
        Padding(
          padding: OnboardingSpacing.contentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: AppTextStyles.onboardingTitle,
                    ),
                  ),
                  if (showSkip)
                    GestureDetector(
                      onTap: onSkip,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.h, left: 8.w),
                        child: Text(
                          AppStrings.skip,
                          style: AppTextStyles.skipButton,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: OnboardingSpacing.titleToSubtitle.h),
              Text(item.subtitle, style: AppTextStyles.onboardingSubtitle),
            ],
          ),
        ),

        Expanded(
          child: Align(
            alignment: item.imageAlignment,
            child: Transform.translate(
              offset: Offset(0, 35.h),
              child: SvgPicture.asset(
                item.imagePath,
                width: 1.sw,
                fit: BoxFit.contain,
                alignment: item.imageAlignment,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
