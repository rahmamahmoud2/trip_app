import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/driver_cubit.dart';
import '../../cubit/driver_state.dart';

class DriverCustomKeypadSheet extends StatelessWidget {
  final DriverState state;
  final DriverCubit cubit;

  const DriverCustomKeypadSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final customerOffer = state.selectedRequest?.offeredFare ?? 50;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final keypadHeight = screenHeight * 0.32;

    return Column(
      children: [
        const Spacer(),
        _buildFareSheet(customerOffer),
        SizedBox(height: keypadHeight, child: _buildKeypad(keypadHeight)),
      ],
    );
  }

  Widget _buildFareSheet(int customerOffer) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowFloating,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.offerYourFare,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
              height: 1.2,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            state.fareInputString,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 56.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
              height: 1.0,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 20.h),
          Divider(height: 1, thickness: 1, color: AppColors.borderGray),
          SizedBox(height: 16.h),
          Text(
            "${AppStrings.customerOffer}: ${AppStrings.egp} $customerOffer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grayText,
              height: 1.3,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () => cubit.submitOffer(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                AppStrings.offer,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypad(double keypadHeight) {
    const rowGap = 7.0;
    final verticalPadding = 10.h;
    final keyHeight = (keypadHeight - verticalPadding * 2 - rowGap.h * 3) / 4;

    return ColoredBox(
      color: AppColors.keypadBg,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          6.w,
          verticalPadding,
          6.w,
          verticalPadding,
        ),
        child: Column(
          children: [
            _buildKeyRow(['1', '2', '3'], ['', 'ABC', 'DEF'], keyHeight),
            SizedBox(height: rowGap.h),
            _buildKeyRow(['4', '5', '6'], ['GHI', 'JKL', 'MNO'], keyHeight),
            SizedBox(height: rowGap.h),
            _buildKeyRow(['7', '8', '9'], ['PQRS', 'TUV', 'WXYZ'], keyHeight),
            SizedBox(height: rowGap.h),
            Row(
              children: [
                Expanded(child: SizedBox(height: keyHeight)),
                SizedBox(width: 6.w),
                Expanded(child: _buildKey('0', '', keyHeight)),
                SizedBox(width: 6.w),
                Expanded(child: _buildBackspaceKey(keyHeight)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyRow(
    List<String> digits,
    List<String> letters,
    double keyHeight,
  ) {
    return Row(
      children: [
        for (var i = 0; i < digits.length; i++) ...[
          if (i > 0) SizedBox(width: 6.w),
          Expanded(child: _buildKey(digits[i], letters[i], keyHeight)),
        ],
      ],
    );
  }

  Widget _buildKey(String digit, String letters, double keyHeight) {
    return SizedBox(
      height: keyHeight,
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(5.r),
          onTap: () => cubit.keypadInput(digit),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                digit,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  height: 1.0,
                ),
              ),
              if (letters.isNotEmpty) ...[
                SizedBox(height: 1.h),
                Text(
                  letters,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    letterSpacing: 1.5,
                    height: 1.0,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceKey(double keyHeight) {
    return SizedBox(
      height: keyHeight,
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(5.r),
          onTap: () => cubit.keypadInput('backspace'),
          child: Center(
            child: Icon(
              Icons.backspace_outlined,
              size: 24.sp,
              color: const Color.fromARGB(255, 23, 23, 23),
            ),
          ),
        ),
      ),
    );
  }
}
