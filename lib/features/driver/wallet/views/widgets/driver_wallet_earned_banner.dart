import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';

class DriverWalletEarnedBanner extends StatelessWidget {
  final double earnedAmount;
  final VoidCallback? onCheckAll;

  const DriverWalletEarnedBanner({
    super.key,
    required this.earnedAmount,
    this.onCheckAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.earnedToday,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.grayText,
            letterSpacing: 0.8,
          ),
        ),
        SizedBox(height: 25.h),
        InkWell(
          onTap: onCheckAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.money, color: AppColors.accentGreen, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    '+ ${earnedAmount.toInt()} EGP',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accentGreen,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    AppStrings.checkAll,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.grayText,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.chevron_right,
                    size: 16.sp,
                    color: AppColors.grayText,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
