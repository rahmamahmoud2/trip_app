import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../models/driver_wallet_model.dart';
import 'widgets/driver_wallet_card.dart';
import 'widgets/driver_wallet_earned_banner.dart';
import 'widgets/driver_wallet_transaction_item.dart';

class DriverWalletScreen extends StatelessWidget {
  const DriverWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const walletData = DriverWalletData.mockData;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: AppColors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.darkText, size: 24.sp),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          children: [
            Text(
              AppStrings.wallet,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 20.h),
            DriverWalletCard(balance: walletData.balance, onAddFunds: () {}),
            SizedBox(height: 24.h),
            DriverWalletEarnedBanner(
              earnedAmount: walletData.earnedToday,
              onCheckAll: () {},
            ),
            SizedBox(height: 24.h),
            Text(
              AppStrings.transactionHistory,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(height: 12.h),
            ...walletData.groupedTransactions.entries.expand((entry) {
              return [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayText,
                    ),
                  ),
                ),
                ...entry.value.map(
                  (tx) => DriverWalletTransactionItem(transaction: tx),
                ),
              ];
            }),
          ],
        ),
      ),
    );
  }
}
