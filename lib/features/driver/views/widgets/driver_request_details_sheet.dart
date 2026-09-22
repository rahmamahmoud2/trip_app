import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/driver_cubit.dart';
import '../../cubit/driver_state.dart';
import '../../models/driver_request_model.dart';
import 'driver_request_info_row.dart';

class DriverRequestDetailsSheet extends StatelessWidget {
  final DriverState state;
  final DriverCubit cubit;

  const DriverRequestDetailsSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final request =
        state.selectedRequest ?? DriverRequestModel.mockRequests.first;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DriverRequestInfoRow(request: request, showProgressBar: true),
          SizedBox(height: 16.h),

          // Accept for X EGP Button
          SizedBox(
            height: 48.h,
            child: ElevatedButton(
              onPressed: () => cubit.acceptDirectly(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                '${AppStrings.acceptFor} ${request.offeredFare} ${AppStrings.egp}',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),

          // Offer your fare text
          Center(
            child: Text(
              AppStrings.offerYourFare,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.grayText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Quick fare
          Row(
            children: [
              _buildQuickChip(55),
              SizedBox(width: 8.w),
              _buildQuickChip(60),
              SizedBox(width: 8.w),
              _buildQuickChip(65),
              SizedBox(width: 8.w),
              Expanded(
                child: SizedBox(
                  height: 42.h,
                  child: ElevatedButton(
                    onPressed: () => cubit.openCustomFare(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Skip Button
          SizedBox(
            height: 44.h,
            child: ElevatedButton(
              onPressed: () => cubit.skipRequest(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkText,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                AppStrings.skip,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickChip(int amount) {
    return Expanded(
      child: SizedBox(
        height: 42.h,
        child: ElevatedButton(
          onPressed: () {
            cubit.selectQuickFare(amount);
            cubit.submitOffer();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            amount.toString(),
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
