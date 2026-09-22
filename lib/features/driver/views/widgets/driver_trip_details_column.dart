import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../../models/driver_request_model.dart';

class DriverTripDetailsColumn extends StatelessWidget {
  final DriverRequestModel request;

  const DriverTripDetailsColumn({
    super.key,
    required this.request,
  });

  String _formatDistance(double km) {
    if (km < 1) {
      return '${(km * 1000).round()} m';
    }
    return '${km.toStringAsFixed(1)}KM';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailRow(
          icon: Icon(Icons.location_on, size: 15.sp, color: AppColors.primary),
          child: Text(
            request.pickup,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        _DetailRow(
          icon: const _TargetIcon(),
          child: Text(
            request.dropoff,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.darkText,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'EGP ${request.displayFare} ~ ${_formatDistance(request.distanceKm)}',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkText,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          '${request.etaMinutes} Min',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final Widget icon;
  final Widget child;

  const _DetailRow({required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: icon,
        ),
        SizedBox(width: 6.w),
        Expanded(child: child),
      ],
    );
  }
}

class _TargetIcon extends StatelessWidget {
  const _TargetIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15.w,
      height: 15.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 13.w,
            height: 13.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grayText, width: 1.2),
            ),
          ),
          Container(
            width: 5.w,
            height: 5.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayText,
            ),
          ),
        ],
      ),
    );
  }
}
