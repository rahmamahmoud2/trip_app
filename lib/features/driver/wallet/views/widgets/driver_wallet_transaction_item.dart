import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_app/core/constants/app_assets.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/features/driver/models/driver_wallet_model.dart';

class DriverWalletTransactionItem extends StatelessWidget {
  final DriverTransactionModel transaction;

  const DriverWalletTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          _buildTransactionIcon(transaction.type),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  transaction.time,
                  style: TextStyle(fontSize: 10.sp, color: AppColors.grayText),
                ),
              ],
            ),
          ),
          Text(
            transaction.amount,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionIcon(DriverTransactionType type) {
    Color bgColor;
    Widget iconWidget;

    switch (type) {
      case DriverTransactionType.fawry:
        bgColor = AppColors.lightGrayBg;
        iconWidget = SvgPicture.asset(
          AppAssets.fawryLogo,
          width: 22.w,
          height: 22.w,
          fit: BoxFit.contain,
        );
        break;
      case DriverTransactionType.card:
        bgColor = AppColors.lightGrayBg;
        iconWidget = SvgPicture.asset(
          AppAssets.cardLogo,
          width: 20.w,
          height: 18.w,
          fit: BoxFit.contain,
        );
        break;
      case DriverTransactionType.paypal:
        bgColor = AppColors.lightGrayBg;
        iconWidget = SvgPicture.asset(
          AppAssets.paypalLogo,
          width: 20.w,
          height: 20.w,
          fit: BoxFit.contain,
        );
        break;
    }

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(child: iconWidget),
    );
  }
}
