import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';

class FareOfferField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const FareOfferField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.lightGrayBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Text(
            '${AppStrings.egp} ',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkText,
              ),
              decoration: InputDecoration(
                hintText: AppStrings.offerYourFare,
                hintStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
              ),
              onChanged: onChanged,
            ),
          ),
          Icon(
            Icons.payments_outlined,
            size: 18.sp,
            color: AppColors.accentGreen,
          ),
        ],
      ),
    );
  }
}
