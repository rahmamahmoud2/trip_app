import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../models/onboarding_item_model.dart';
import 'onboarding_indicator.dart';
import 'onboarding_spacing.dart';

class OnboardingBottomBar extends StatelessWidget {
  final int currentPage;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onAuthAction;

  const OnboardingBottomBar({
    super.key,
    required this.currentPage,
    required this.isLastPage,
    required this.onNext,
    required this.onAuthAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: OnboardingSpacing.bottomBarPadding,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isLastPage
            ? _buildFullWidthAuthButton()
            : _buildIndicatorAndNextRow(),
      ),
    );
  }

  Widget _buildIndicatorAndNextRow() {
    return Row(
      key: const ValueKey('indicator_and_next'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnboardingIndicator(
          currentIndex: currentPage,
          count: OnboardingItemModel.pages.length,
        ),

        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBg,
            foregroundColor: AppColors.buttonText,
            elevation: 0,
            minimumSize: Size(88.w, 44.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                OnboardingSpacing.buttonRadius.r,
              ),
            ),
          ),
          child: Text(AppStrings.next, style: AppTextStyles.nextButton),
        ),
      ],
    );
  }

  Widget _buildFullWidthAuthButton() {
    return SizedBox(
      key: const ValueKey('auth_full_button'),
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onAuthAction,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBg,
          foregroundColor: AppColors.buttonText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              OnboardingSpacing.buttonRadius.r,
            ),
          ),
        ),
        child: Text(AppStrings.signUpLogIn, style: AppTextStyles.authButton),
      ),
    );
  }
}
