import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../../models/driver_request_model.dart';

class DriverRequestInfoRow extends StatelessWidget {
  final DriverRequestModel request;
  final bool showChevron;
  final bool showProgressBar;

  const DriverRequestInfoRow({
    super.key,
    required this.request,
    this.showChevron = true,
    this.showProgressBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPassengerColumn(),
            SizedBox(width: 12.w),
            Expanded(child: _buildTripDetailsColumn()),
            if (showChevron) ...[
              SizedBox(width: 4.w),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Icon(
                  Icons.chevron_right,
                  color: AppColors.grayText,
                  size: 22.sp,
                ),
              ),
            ],
          ],
        ),
        if (showProgressBar) ...[
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(2.r),
            child: LinearProgressIndicator(
              value: 0.65,
              minHeight: 3.h,
              backgroundColor: AppColors.borderGray,
              color: AppColors.primary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPassengerColumn() {
    return SizedBox(
      width: 64.w,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColors.primaryLight,
            child: Icon(
              Icons.person,
              size: 28.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            request.passengerName,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 11.sp, color: AppColors.starYellow),
                SizedBox(width: 2.w),
                Text(
                  '${request.rating} (${request.tripsCount})',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripDetailsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16.sp,
              color: AppColors.primary,
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: Text(
                request.pickup,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.darkText, width: 1.5),
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                request.dropoff,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          'EGP ${request.displayFare} ~ ${request.distanceKm}KM',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grayText,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          '${request.etaMinutes} Min',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grayText,
          ),
        ),
      ],
    );
  }
}
