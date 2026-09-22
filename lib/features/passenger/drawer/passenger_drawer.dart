import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_assets.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import 'package:trip_app/core/navigation/drawer_navigation.dart';
import 'package:trip_app/features/driver/views/driver_home_screen.dart';
import 'package:trip_app/features/passenger/wallet/views/wallet_screen.dart';

import 'widgets/drawer_header_profile.dart';
import 'widgets/drawer_menu_item.dart';

class PassengerDrawer extends StatelessWidget {
  const PassengerDrawer({super.key});

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
            // Profile Header
            DrawerHeaderProfile(onTap: () => Navigator.pop(context)),

            const Divider(color: AppColors.grey, height: 1, thickness: 1),

            // Navigation Items List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerRides,
                      title: AppStrings.drawerRides,
                      isSelected: true,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerRentByTime,
                      title: AppStrings.drawerRentByTime,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerRentByDays,
                      title: AppStrings.drawerRentByDays,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerWallet,
                      title: AppStrings.drawerWallet,
                      onTap: () =>
                          pushFromDrawer(context, const WalletScreen()),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerRequestsHistory,
                      title: AppStrings.drawerRequestsHistory,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerSettings,
                      title: AppStrings.drawerSettings,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerCallSupport,
                      title: AppStrings.drawerCallSupport,
                      onTap: () => Navigator.pop(context),
                    ),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerWaitlistFriend,
                      title: AppStrings.drawerWaitlistFriend,
                      onTap: () => Navigator.pop(context),
                    ),

                    SizedBox(height: 16.h),
                    DrawerMenuItem(
                      svgAsset: AppAssets.drawerSignOut,
                      title: AppStrings.drawerSignOut,
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(height: 40.h),
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
                          Icons.drive_eta_rounded,
                          color: AppColors.primary,
                          size: 22.sp,
                        ),
                        title: Text(
                          AppStrings.switchToDriverMode,
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
                              builder: (_) => const DriverHomeScreen(),
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
