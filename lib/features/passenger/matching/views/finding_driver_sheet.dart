import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/passenger_cubit.dart';
import '../../cubit/passenger_state.dart';

class FindingDriverSheet extends StatelessWidget {
  final PassengerState state;
  final PassengerCubit cubit;

  const FindingDriverSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Notice text
          Text(
            AppStrings.noDriversAvailable,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),

          // Fare Stepper Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStepButton(label: '+ 5', onTap: cubit.decreaseFare),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  '${state.fare} ${AppStrings.egp}',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              _buildStepButton(label: '+ 5', onTap: cubit.increaseFare),
            ],
          ),
          SizedBox(height: 16.h),

          // Raise Fare Button
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: ElevatedButton(
              onPressed: cubit.showOffers,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                AppStrings.raiseFair,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Cancel Request Button
          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: OutlinedButton(
              onPressed: cubit.cancelRequest,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.borderGray),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                AppStrings.cancelRequest,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),

          // Bottom summary row (Destination + Current Fare)
          Row(
            children: [
              Icon(Icons.location_on, size: 20.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  state.destination,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${AppStrings.egp} ${state.fare}',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkText,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.payments_outlined,
                size: 18.sp,
                color: AppColors.accentGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: 90.w,
          height: 50.h,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
