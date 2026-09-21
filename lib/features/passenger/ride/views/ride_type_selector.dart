import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../models/ride_type_model.dart';

class RideTypeSelector extends StatelessWidget {
  final RideCategory selectedCategory;
  final ValueChanged<RideCategory> onSelect;

  const RideTypeSelector({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RideTypeModel.availableTypes.map((type) {
        final isSelected = type.category == selectedCategory;

        return Expanded(
          child: GestureDetector(
            onTap: () => onSelect(type.category),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(vertical: 22.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryLight
                    : AppColors.borderGray,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.borderGray,
                  width: isSelected ? 1.5.w : 1.w,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 28.h,
                    child: SvgPicture.asset(type.iconPath, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    type.title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
