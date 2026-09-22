import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../../models/driver_request_model.dart';

import 'driver_offer_progress_bar.dart';
import 'driver_passenger_profile_column.dart';
import 'driver_trip_details_column.dart';

class DriverRequestInfoRow extends StatelessWidget {
  final DriverRequestModel request;
  final bool showChevron;
  final double? offerProgress;

  const DriverRequestInfoRow({
    super.key,
    required this.request,
    this.showChevron = true,
    this.offerProgress,
  });

  bool get _showsProgressSection => offerProgress != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DriverPassengerProfileColumn(request: request),
            SizedBox(width: 10.w),
            Expanded(child: DriverTripDetailsColumn(request: request)),
            if (showChevron) ...[
              SizedBox(width: 4.w),
              Icon(Icons.chevron_right, size: 22.sp, color: AppColors.grayText),
            ],
          ],
        ),
        if (_showsProgressSection) ...[
          SizedBox(height: 8.h),
          DriverOfferProgressBar(progress: offerProgress!),
        ],
      ],
    );
  }
}
