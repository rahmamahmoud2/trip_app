import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_assets.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import 'package:trip_app/core/navigation/drawer_navigation.dart';
import 'package:trip_app/features/passenger/views/passenger_home_screen.dart';
import '../../wallet/views/driver_wallet_screen.dart';
import 'widgets/driver_drawer_header.dart';
import 'widgets/driver_drawer_menu_item.dart';

class DriverDrawer extends StatelessWidget {
  const DriverDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.transparent,
      elevation: 0,
      width: 0.85.sw,
      child: SafeArea(
        child: Column(
          children: [
            // Driver Profile Header
            DriverDrawerHeader(onTap: () => Navigator.pop(context)),

            const Divider(color: AppColors.borderGray, height: 1, thickness: 1),

            // Navigation Items List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerRides,
                      title: AppStrings.drawerRides,
                      isSelected: true,
                      onTap: () => Navigator.pop(context),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerRentByTime,
                      title: AppStrings.drawerRentByTime,
                      onTap: () => Navigator.pop(context),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerRentByDays,
                      title: AppStrings.drawerRentByDays,
                      onTap: () => Navigator.pop(context),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerWallet,
                      title: AppStrings.drawerWallet,
                      onTap: () =>
                          pushFromDrawer(context, const DriverWalletScreen()),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerRequestsHistory,
                      title: AppStrings.drawerRequestsHistory,
                      onTap: () => Navigator.pop(context),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerSettings,
                      title: AppStrings.drawerSettings,
                      onTap: () => Navigator.pop(context),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerCallSupport,
                      title: AppStrings.drawerCallSupport,
                      onTap: () => Navigator.pop(context),
                    ),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerWaitlistFriend,
                      title: AppStrings.drawerWaitlistFriend,
                      textColor: AppColors.primary,
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(height: 15.h),
                    DriverDrawerMenuItem(
                      svgAsset: AppAssets.drawerSignOut,
                      title: AppStrings.drawerSignOut,
                      textColor: AppColors.dangerRed,
                      onTap: () => Navigator.pop(context),
                    ),

                    SizedBox(height: 90.h),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.person_rounded,
                          color: AppColors.primary,
                          size: 22.sp,
                        ),
                        title: Text(
                          AppStrings.switchToPassengerMode,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.primary,
                          size: 14.sp,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PassengerHomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
