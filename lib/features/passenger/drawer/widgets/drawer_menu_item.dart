import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_app/core/constants/app_colors.dart';

class DrawerMenuItem extends StatelessWidget {
  final String svgAsset;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerMenuItem({
    super.key,
    required this.svgAsset,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.selectedItemBg : AppColors.transparent,
      ),
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
        leading: SizedBox(
          width: 24.w,
          height: 24.w,
          child: SvgPicture.asset(svgAsset, fit: BoxFit.contain),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,
            color: AppColors.darkText,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
