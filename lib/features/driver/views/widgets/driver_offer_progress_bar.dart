import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';

/// Thick blue loading line at the bottom of the request info card.
class DriverOfferProgressBar extends StatelessWidget {
  final double progress;

  const DriverOfferProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(2.r),
      child: SizedBox(
        height: 4.h,
        width: double.infinity,
        child: ColoredBox(
          color: AppColors.borderGray,
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: clampedProgress,
              heightFactor: 1,
              child: const ColoredBox(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
