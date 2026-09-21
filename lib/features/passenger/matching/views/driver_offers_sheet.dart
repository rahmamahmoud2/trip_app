import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/passenger_cubit.dart';
import '../../cubit/passenger_state.dart';
import 'driver_offer_card.dart';

class DriverOffersSheet extends StatelessWidget {
  final PassengerState state;
  final PassengerCubit cubit;

  const DriverOffersSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final displayFare = state.fare > 0 ? state.fare : 50;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(16.w, 72.h, 16.w, 8.h),
            itemCount: state.offers.length,
            itemBuilder: (context, index) {
              final offer = state.offers[index];
              return DriverOfferCard(
                offer: offer,
                onAccept: () => cubit.acceptOffer(offer, context),
                onDecline: () => cubit.declineOffer(offer.id),
              );
            },
          ),
        ),
        _buildBottomPanel(displayFare),
      ],
    );
  }

  Widget _buildBottomPanel(int displayFare) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 55.h,
            child: OutlinedButton(
              onPressed: cubit.cancelRequest,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                AppStrings.cancelRequest,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Icon(Icons.location_on, size: 18.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  state.destination,
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
          SizedBox(height: 30.h),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14.sp, color: AppColors.darkText),
                  children: [
                    TextSpan(
                      text: AppStrings.egp,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: ' $displayFare',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.payments_outlined,
                size: 22.sp,
                color: AppColors.accentGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
