import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';

class WalletCashCard extends StatelessWidget {
  final VoidCallback? onAddFunds;

  const WalletCashCard({super.key, this.onAddFunds});

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
            // Decorative light background shapes
            Positioned(
              right: -20.w,
              top: -20.h,
              bottom: -20.h,
              width: 180.w,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.walletCardShape,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: AppColors.darkText,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        AppStrings.tripUCash,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkText,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.darkText,
                        size: 26.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppStrings.walletBalanceZero,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 79, 82, 88),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 44.h),
                  ElevatedButton.icon(
                    onPressed: onAddFunds ?? () {},
                    icon: Icon(Icons.add, size: 16.sp, color: AppColors.white),
                    label: Text(
                      AppStrings.addFunds.replaceFirst('+ ', ''),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
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
