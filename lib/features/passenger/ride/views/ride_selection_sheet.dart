import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import 'package:trip_app/features/passenger/ride/views/widgets/fare_offer_field.dart';
import '../../cubit/passenger_cubit.dart';
import '../../cubit/passenger_state.dart';

import '../../location/views/location_card_item.dart';
import 'ride_type_selector.dart';

class RideSelectionSheet extends StatefulWidget {
  final PassengerState state;
  final PassengerCubit cubit;

  const RideSelectionSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  State<RideSelectionSheet> createState() => _RideSelectionSheetState();
}

class _RideSelectionSheetState extends State<RideSelectionSheet> {
  late final TextEditingController _fareController;

  @override
  void initState() {
    super.initState();
    _fareController = TextEditingController(
      text: widget.state.fare > 0 ? widget.state.fare.toString() : '',
    );
  }

  @override
  void didUpdateWidget(covariant RideSelectionSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.fare != widget.state.fare) {
      final text = widget.state.fare > 0 ? widget.state.fare.toString() : '';
      if (_fareController.text != text) {
        _fareController.text = text;
        _fareController.selection = TextSelection.collapsed(
          offset: text.length,
        );
      }
    }
  }

  @override
  void dispose() {
    _fareController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        children: [
          // Ride / Comfort category selector
          RideTypeSelector(
            selectedCategory: widget.state.selectedCategory,
            onSelect: widget.cubit.selectCategory,
          ),
          SizedBox(height: 12.h),

          // Form 1: Pickup Location
          LocationCardItem(
            icon: Icons.location_on,
            iconColor: AppColors.primary,
            text: widget.state.pickup,
          ),
          SizedBox(height: 8.h),

          // Form 2: Drop-off Location
          LocationCardItem(
            icon: Icons.radio_button_checked,
            iconColor: AppColors.primary,
            text: widget.state.destination,
          ),
          SizedBox(height: 8.h),

          // Form 3: Offer your fare (Live Editable)
          FareOfferField(
            controller: _fareController,
            onChanged: (val) {
              final parsed = int.tryParse(val.trim());
              if (parsed != null) {
                widget.cubit.setFare(parsed);
              } else if (val.isEmpty) {
                widget.cubit.setFare(0);
              }
            },
          ),
          SizedBox(height: 14.h),

          // Payment method header and row
          _buildPaymentRow(),
          SizedBox(height: 16.h),

          // Confirm Button
          _buildConfirmButton(),
        ],
      ),
    );
  }

  Widget _buildPaymentRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAYMENT',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.grayText,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Icon(Icons.payments, size: 20.sp, color: AppColors.accentGreen),
            SizedBox(width: 8.w),
            Text(
              AppStrings.cash,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  AppStrings.change,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.grayText),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 16.sp,
                  color: AppColors.grayText,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: widget.cubit.confirmRide,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          AppStrings.confirm,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
