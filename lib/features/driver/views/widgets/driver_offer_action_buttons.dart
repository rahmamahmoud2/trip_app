import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';

class DriverAcceptButton extends StatelessWidget {
  final int fare;
  final VoidCallback onPressed;

  const DriverAcceptButton({
    super.key,
    required this.fare,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          '${AppStrings.acceptFor} $fare ${AppStrings.egp}',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class DriverOfferFareSection extends StatelessWidget {
  final List<int> quickFares;
  final ValueChanged<int> onQuickFare;
  final VoidCallback onCustomFare;

  const DriverOfferFareSection({
    super.key,
    required this.quickFares,
    required this.onQuickFare,
    required this.onCustomFare,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.offerYourFare,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.darkText,
          ),
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            for (var i = 0; i < quickFares.length; i++) ...[
              if (i > 0) SizedBox(width: 8.w),
              Expanded(
                child: _QuickFareButton(
                  fare: quickFares[i],
                  onPressed: () => onQuickFare(quickFares[i]),
                ),
              ),
            ],
            SizedBox(width: 8.w),
            _CustomFareButton(onPressed: onCustomFare),
          ],
        ),
      ],
    );
  }
}

class DriverSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DriverSkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF202C39),
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          AppStrings.skip,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _QuickFareButton extends StatelessWidget {
  final int fare;
  final VoidCallback onPressed;

  const _QuickFareButton({required this.fare, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          '$fare',
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _CustomFareButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _CustomFareButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55.w,
      height: 55.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Icon(Icons.edit_outlined, size: 18.sp, color: AppColors.white),
      ),
    );
  }
}
