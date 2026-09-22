import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import 'onboarding_spacing.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(
            right: index < count - 1 ? OnboardingSpacing.indicatorGap.w : 0,
          ),
          height: OnboardingSpacing.indicatorDotSize.h,
          width: isActive
              ? OnboardingSpacing.indicatorActiveWidth.w
              : OnboardingSpacing.indicatorDotSize.w,
          decoration: BoxDecoration(
            color: isActive
                ? const Color.fromARGB(102, 36, 35, 35)
                : AppColors.indicatorActive,
            borderRadius: BorderRadius.circular(30.r),
          ),
        );
      }),
    );
  }
}
