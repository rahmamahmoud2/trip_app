import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/passenger_cubit.dart';
import '../../cubit/passenger_state.dart';
import 'ride_type_selector.dart';

class RoutePreviewSheet extends StatelessWidget {
  final PassengerState state;
  final PassengerCubit cubit;

  const RoutePreviewSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
          RideTypeSelector(
            selectedCategory: state.selectedCategory,
            onSelect: cubit.selectCategory,
          ),
          SizedBox(height: 12.h),

          // Row 1: Pickup Location (Plain row with icon)
          Row(
            children: [
              Icon(
                Icons.radio_button_checked,
                size: 18.sp,
                color: AppColors.darkText,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  state.pickup,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),

          // Row 2: Drop-off Location (Plain row with location pin icon)
          Row(
            children: [
              Icon(Icons.location_on, size: 18.sp, color: AppColors.primary),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  state.destination,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),

          // Row 3: Fare Row (EGP 50 + Cash Icon)
          Row(
            children: [
              Text(
                '${AppStrings.egp} ',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkText,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                '${state.fare}',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkText,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.payments_outlined,
                size: 20.sp,
                color: AppColors.accentGreen,
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Row 4: Travel Time Badge Container
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_filled,
                  size: 16.sp,
                  color: AppColors.primary,
                ),
                SizedBox(width: 6.w),
                Text(
                  'Travel Time: - 15 min.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Row 5: Find a Ride Button
          SizedBox(
            width: double.infinity,
            height: 54.h,
            child: ElevatedButton(
              onPressed: cubit.findRide,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                AppStrings.findARide,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
