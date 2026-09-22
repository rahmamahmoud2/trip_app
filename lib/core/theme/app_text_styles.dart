import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'Inter';

  /// Large Onboarding Title
  static TextStyle get onboardingTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    height: 1.1,
    letterSpacing: 0.25,
  );

  /// Onboarding Subtitle/Body
  static TextStyle get onboardingSubtitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleText,
    height: 1.4,
    letterSpacing: -1,
  );

  /// Skip Button text
  static TextStyle get skipButton => TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  /// Next Button text
  static TextStyle get nextButton => TextStyle(
    fontFamily: fontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  ///  text ("Sign Up / Log In")
  static TextStyle get authButton => TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
}
