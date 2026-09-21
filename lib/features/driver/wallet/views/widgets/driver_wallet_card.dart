import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';

class DriverWalletCard extends StatelessWidget {
  final double balance;
  final VoidCallback? onAddFunds;

  const DriverWalletCard({super.key, required this.balance, this.onAddFunds});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.walletCardStart, AppColors.walletCardEnd],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Stack(
          children: [
            // Decorative geometric shapes
            Positioned(
              right: -25.w,
              top: -30.h,
              child: Container(
                width: 140.w,
                height: 140.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.walletCardShape,
                ),
              ),
            ),
            Positioned(
              right: 15.w,
              bottom: -40.h,
              child: Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.walletCardShape,
                ),
              ),
            ),
            // Card Content
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.tripUCash,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.black,
                        size: 22.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'EGP ${balance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 79, 79, 79),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: onAddFunds,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 7.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          AppStrings.addFunds,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
