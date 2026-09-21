import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class LocationFieldsWidget extends StatelessWidget {
  final String pickup;
  final String destination;

  const LocationFieldsWidget({
    super.key,
    required this.pickup,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.lightGrayBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        children: [
          // Pickup Location Row
          Row(
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  pickup,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                  child: Center(
                    child: Container(
                      height: 14.h,
                      width: 1.5.w,
                      color: AppColors.borderGray,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                const Expanded(
                  child: Divider(color: AppColors.borderGray, height: 1),
                ),
              ],
            ),
          ),

          // Dropoff Location Row
          Row(
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  color: AppColors.darkText,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  destination,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
