import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class DrawerHeaderProfile extends StatelessWidget {
  final VoidCallback? onTap;

  const DrawerHeaderProfile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                children: [
                  Text(
                    AppStrings.profileName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
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
                        AppStrings.profileRating,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.grayText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, size: 20.sp, color: AppColors.grayText),
          ],
        ),
      ),
    );
  }
}
