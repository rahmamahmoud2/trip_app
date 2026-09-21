import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_app/core/constants/app_colors.dart';

class DriverDrawerMenuItem extends StatelessWidget {
  final String svgAsset;
  final String title;
  final bool isSelected;
  final Color? textColor;
  final bool showChevron;
  final VoidCallback onTap;

  const DriverDrawerMenuItem({
    super.key,
    required this.svgAsset,
    required this.title,
    this.isSelected = false,
    this.textColor,
    this.showChevron = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.selectedItemBg : AppColors.transparent,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
        leading: SizedBox(
          width: 22.w,
          height: 22.w,
          child: SvgPicture.asset(svgAsset, fit: BoxFit.contain),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: textColor ?? AppColors.darkText,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
