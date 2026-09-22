import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../../models/driver_request_model.dart';

class DriverPassengerProfileColumn extends StatelessWidget {
  final DriverRequestModel request;

  const DriverPassengerProfileColumn({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundColor: AppColors.primaryLight,
            child: Icon(
              Icons.person,
              size: 28.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            request.passengerName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
          SizedBox(height: 3.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 12.sp, color: AppColors.starYellow),
                SizedBox(width: 2.w),
                Text(
                  '${request.rating} (${request.tripsCount})',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grayText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
