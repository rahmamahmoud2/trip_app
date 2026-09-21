import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';

class DriverDrawerHeader extends StatelessWidget {
  final VoidCallback? onTap;

  const DriverDrawerHeader({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.person, size: 28.sp, color: AppColors.primary),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.driverProfileName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkText,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14.sp,
                        color: AppColors.starYellow,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.driverProfileRating,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.grayText, size: 22.sp),
          ],
        ),
      ),
    );
  }
}
