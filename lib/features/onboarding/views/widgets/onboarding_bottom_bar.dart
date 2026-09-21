import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../models/onboarding_item_model.dart';
import 'onboarding_indicator.dart';

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
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h, top: 6.h),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isLastPage
            ? _buildFullWidthAuthButton()
            : _buildIndicatorAndNextRow(),
      ),
    );
  }

  /// Row showing Indicator Dots on the left and "Next" button on the right
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(AppStrings.next, style: AppTextStyles.nextButton),
        ),
      ],
    );
  }

  /// Full-width "Sign Up / Log In" button for the last onboarding screen
  Widget _buildFullWidthAuthButton() {
    return SizedBox(
      key: const ValueKey('auth_full_button'),
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: onAuthAction,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBg,
          foregroundColor: AppColors.buttonText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(AppStrings.signUpLogIn, style: AppTextStyles.authButton),
      ),
    );
  }
}
