import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';

class WalletPaymentMethodSection extends StatelessWidget {
  final VoidCallback? onChangePayment;
  final VoidCallback? onAddPaymentMethod;

  const WalletPaymentMethodSection({
    super.key,
    this.onChangePayment,
    this.onAddPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          AppStrings.paymentMethod,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.grayText,
            letterSpacing: 0.8,
          ),
        ),
        SizedBox(height: 30.h),

        // Cash Payment Option Row
        Row(
          children: [
            Icon(
              Icons.payments_rounded,
              size: 24.sp,
              color: AppColors.accentGreen,
            ),
            SizedBox(width: 10.w),
            Text(
              AppStrings.cash,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onChangePayment,
              child: Row(
                children: [
                  Text(
                    AppStrings.change,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.grayText,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.chevron_right,
                    size: 18.sp,
                    color: AppColors.grayText,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 40.h),

        // "+ Add Payment Method" Button (Left aligned, compact)
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: onAddPaymentMethod ?? () {},
            icon: Icon(Icons.add, size: 18.sp, color: AppColors.white),
            label: Text(
              AppStrings.addPaymentMethod.replaceFirst('+ ', ''),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
