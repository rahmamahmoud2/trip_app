import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';

class DriverAppBar extends StatelessWidget {
  final bool isOnline;
  final VoidCallback onMenuPressed;
  final ValueChanged<bool> onToggleOnline;
  final VoidCallback? onRadarPressed;

  const DriverAppBar({
    super.key,
    required this.isOnline,
    required this.onMenuPressed,
    required this.onToggleOnline,
    this.onRadarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu button
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(
              Icons.menu,
              color: AppColors.darkText,
              size: 24.sp,
            ),
            splashRadius: 22.r,
          ),

          // Online / Offline Toggle Pill
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.selectedItemBg,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildToggleOption(
                  title: AppStrings.offline,
                  isActive: !isOnline,
                  onTap: () => onToggleOnline(false),
                ),
                _buildToggleOption(
                  title: AppStrings.online,
                  isActive: isOnline,
                  onTap: () => onToggleOnline(true),
                ),
              ],
            ),
          ),

          // Settings icon
          IconButton(
            onPressed: onRadarPressed,
            icon: Icon(
              Icons.settings_outlined,
              color: AppColors.darkText,
              size: 24.sp,
            ),
            splashRadius: 22.r,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: isActive ? AppColors.white : AppColors.grayText,
          ),
        ),
      ),
    );
  }
}
