import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/driver_cubit.dart';
import '../../cubit/driver_state.dart';
import '../../models/driver_request_model.dart';
import 'driver_request_info_row.dart';

class DriverWaitingReplyOverlay extends StatelessWidget {
  final DriverState state;
  final DriverCubit cubit;

  const DriverWaitingReplyOverlay({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final request =
        state.selectedRequest ?? DriverRequestModel.mockRequests.first;

    return Column(
      children: [
        Expanded(
          child: Container(
            color: AppColors.overlayDark,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.offeringYourFare,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  '${state.counterFare} ${AppStrings.egp}',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppStrings.waitingForReplay,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom passenger info card
        Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: DriverRequestInfoRow(
            request: request,
            showProgressBar: true,
          ),
        ),
      ],
    );
  }
}
