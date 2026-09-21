import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../models/wallet_transaction_model.dart';
import 'widgets/wallet_cash_card.dart';
import 'widgets/wallet_payment_method_section.dart';
import 'widgets/wallet_transaction_item.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          children: [
            // Screen Title
            Text(
              AppStrings.wallet,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 12.h),

            // TripU Cash Balance Card
            const WalletCashCard(),
            SizedBox(height: 25.h),

            // Payment Method Section
            const WalletPaymentMethodSection(),
            SizedBox(height: 28.h),

            // Transaction History Section
            _buildTransactionHistoryHeader(),
            SizedBox(height: 14.h),

            // Today's Transactions
            _buildDateHeader(AppStrings.today),
            SizedBox(height: 8.h),
            ...WalletTransactionModel.todayTransactions.map(
              (tx) => WalletTransactionItem(transaction: tx),
            ),

            SizedBox(height: 16.h),

            // Previous Transactions (Tuesday, 19 June)
            _buildDateHeader(AppStrings.tuesday19June),
            SizedBox(height: 8.h),
            ...WalletTransactionModel.previousTransactions.map(
              (tx) => WalletTransactionItem(transaction: tx),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: AppColors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leadingWidth: 72.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 6.h, bottom: 6.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.borderGray, width: 0.8),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.menu, size: 22.sp, color: AppColors.darkText),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionHistoryHeader() {
    return Text(
      AppStrings.transactionHistory,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
    );
  }

  Widget _buildDateHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.grayText,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
