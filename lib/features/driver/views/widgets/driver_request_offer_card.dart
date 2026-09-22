import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../../cubit/driver_cubit.dart';
import '../../models/driver_request_model.dart';
import 'driver_offer_action_buttons.dart';
import 'driver_request_info_row.dart';

class DriverRequestOfferCard extends StatelessWidget {
  final DriverRequestModel request;
  final DriverCubit cubit;
  final double offerProgress;

  const DriverRequestOfferCard({
    super.key,
    required this.request,
    required this.cubit,
    required this.offerProgress,
  });

  List<int> get _quickFares => [
    request.offeredFare + 5,
    request.offeredFare + 10,
    request.offeredFare + 15,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          DriverRequestInfoRow(
            request: request,
            offerProgress: offerProgress,
          ),
          SizedBox(height: 14.h),
          DriverAcceptButton(
            fare: request.offeredFare,
            onPressed: cubit.acceptCustomerOffer,
          ),
          SizedBox(height: 14.h),
          DriverOfferFareSection(
            quickFares: _quickFares,
            onQuickFare: (fare) {
              cubit.selectQuickFare(fare);
              cubit.submitOffer();
            },
            onCustomFare: cubit.openCustomFare,
          ),
          SizedBox(height: 12.h),
          DriverSkipButton(onPressed: cubit.skipRequest),
        ],
      ),
    );
  }
}
