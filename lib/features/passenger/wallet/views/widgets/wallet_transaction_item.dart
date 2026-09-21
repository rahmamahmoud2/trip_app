import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../models/wallet_transaction_model.dart';

class WalletTransactionItem extends StatelessWidget {
  final WalletTransactionModel transaction;

  const WalletTransactionItem({super.key, required this.transaction});

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
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  transaction.time,
                  style: TextStyle(fontSize: 11.sp, color: AppColors.grayText),
                ),
              ],
            ),
          ),
          Text(
            '+EGP ${transaction.amount}',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionIcon(TransactionType type) {
    Widget iconContent;

    switch (type) {
      case TransactionType.fawry:
        iconContent = SvgPicture.asset(
          AppAssets.fawryLogo,
          width: 26.w,
          height: 22.w,
          fit: BoxFit.contain,
        );
      case TransactionType.card:
        iconContent = SvgPicture.asset(
          AppAssets.cardLogo,
          width: 24.w,
          height: 20.w,
          fit: BoxFit.contain,
        );
      case TransactionType.paypal:
        iconContent = SvgPicture.asset(
          AppAssets.paypalLogo,
          width: 24.w,
          height: 22.w,
          fit: BoxFit.contain,
        );
    }

    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: AppColors.lightGrayBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: iconContent,
    );
  }
}
