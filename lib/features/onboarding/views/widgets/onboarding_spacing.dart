import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Onboarding layout spacing matched to the 390×844 design spec.
abstract class OnboardingSpacing {
  static const double horizontalPadding = 24;
  static const double statusBarToTitle = 60;
  static const double titleToSubtitle = 16;
  static const double illustrationToControls = 40;
  static const double controlsToBottom = 40;
  static const double buttonRadius = 8;
  static const double indicatorDotSize = 6;
  static const double indicatorActiveWidth = 20;
  static const double indicatorGap = 6;

  static double topPadding(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final target = statusBarToTitle.h;
    return (target - statusBarHeight).clamp(0.0, target);
  }

  static EdgeInsets get bottomBarPadding => EdgeInsets.fromLTRB(
    horizontalPadding.w,
    illustrationToControls.h,
    horizontalPadding.w,
    controlsToBottom.h,
  );

  static EdgeInsets get contentPadding =>
      EdgeInsets.symmetric(horizontal: horizontalPadding.w);
}
