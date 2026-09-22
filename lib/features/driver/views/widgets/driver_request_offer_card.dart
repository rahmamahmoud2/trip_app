import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/driver_cubit.dart';
import '../../models/driver_request_model.dart';

class DriverRequestOfferCard extends StatelessWidget {
  final DriverRequestModel request;
  final DriverCubit cubit;

  const DriverRequestOfferCard({
    super.key,
    required this.request,
    required this.cubit,
  });

  List<int> get _quickFares => [
    request.offeredFare + 5,
    request.offeredFare + 10,
    request.offeredFare + 15,
  ];

  String get _distanceLabel {
    if (request.distanceKm < 1) {
      return '${(request.distanceKm * 1000).round()} m';
    }
    return '${request.distanceKm.toStringAsFixed(1)} KM';
  }

  @override
  Widget build(BuildContext context) {
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
          _buildPassengerHeader(),
          SizedBox(height: 16.h),
          _buildAcceptButton(),
          SizedBox(height: 16.h),
          _buildQuickFareSection(),
          SizedBox(height: 12.h),
          _buildSkipButton(),
        ],
      ),
    );
  }

  Widget _buildPassengerHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 26.r,
          backgroundColor: AppColors.primaryLight,
          child: Icon(Icons.person, size: 28.sp, color: AppColors.primary),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    request.passengerName,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkText,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(Icons.star, size: 13.sp, color: AppColors.starYellow),
                  SizedBox(width: 2.w),
                  Text(
                    '${request.rating}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkText,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    '(${request.tripsCount} rides)',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grayText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                request.pickup,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grayText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${request.etaMinutes} Min',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              _distanceLabel,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAcceptButton() {
    return SizedBox(
      height: 60.h,
      child: ElevatedButton(
        onPressed: cubit.acceptCustomerOffer,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          '${AppStrings.acceptFor} ${request.offeredFare} ${AppStrings.egp}',
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildQuickFareSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.offerYourFare,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkText,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            for (var i = 0; i < _quickFares.length; i++) ...[
              if (i > 0) SizedBox(width: 8.w),
              Expanded(child: _buildQuickFareChip(_quickFares[i])),
            ],
            SizedBox(width: 8.w),
            _buildCustomFareButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickFareChip(int fare) {
    return SizedBox(
      height: 60.h,
      child: OutlinedButton(
        onPressed: () {
          cubit.selectQuickFare(fare);
          cubit.submitOffer();
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          '$fare',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomFareButton() {
    return SizedBox(
      width: 60.w,
      height: 60.h,
      child: OutlinedButton(
        onPressed: cubit.openCustomFare,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Icon(Icons.edit_outlined, size: 20.sp, color: AppColors.white),
      ),
    );
  }

  Widget _buildSkipButton() {
    return SizedBox(
      height: 57.h,
      child: ElevatedButton(
        onPressed: cubit.skipRequest,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(204, 0, 0, 0),
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          AppStrings.skip,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
