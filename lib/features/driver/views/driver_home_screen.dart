import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import '../cubit/driver_cubit.dart';
import '../cubit/driver_state.dart';
import '../drawer/views/driver_drawer.dart';
import 'widgets/driver_app_bar.dart';
import 'widgets/driver_custom_keypad.dart';
import 'widgets/driver_map_view.dart';
import 'widgets/driver_request_card.dart';
import 'widgets/driver_request_details_sheet.dart';
import 'widgets/driver_trip_accepted_sheet.dart';
import 'widgets/driver_waiting_reply_overlay.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverCubit(),
      child: const _DriverHomeScreenBody(),
    );
  }
}

class _DriverHomeScreenBody extends StatefulWidget {
  const _DriverHomeScreenBody();

  @override
  State<_DriverHomeScreenBody> createState() => _DriverHomeScreenBodyState();
}

class _DriverHomeScreenBodyState extends State<_DriverHomeScreenBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DriverCubit>();

    return BlocBuilder<DriverCubit, DriverState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors.white,
          drawer: const DriverDrawer(),
          body: SafeArea(
            child: Stack(
              children: [
                // Main Content depending on step
                if (state.step == DriverStep.feed)
                  _buildFeedView(context, state, cubit)
                else
                  _buildMapAndSheetView(context, state, cubit),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeedView(
    BuildContext context,
    DriverState state,
    DriverCubit cubit,
  ) {
    return Column(
      children: [
        // App Bar with Toggle
        DriverAppBar(
          isOnline: state.isOnline,
          onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
          onToggleOnline: (val) => cubit.toggleOnline(val),
          onRadarPressed: () {},
        ),
        const Divider(color: AppColors.dividerColor, height: 1, thickness: 1),

        // Requests List or Offline State
        Expanded(
          child: !state.isOnline
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 48.sp,
                        color: AppColors.grayText,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'You are currently offline',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Go online to start receiving ride requests',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.grayText,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  itemCount: state.requests.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.dividerColor,
                    height: 1,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    final request = state.requests[index];
                    return DriverRequestCard(
                      request: request,
                      onTap: () => cubit.selectRequest(request),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildMapAndSheetView(
    BuildContext context,
    DriverState state,
    DriverCubit cubit,
  ) {
    return Stack(
      children: [
        // Map View with route
        const Positioned.fill(
          child: DriverMapView(),
        ),

        // Floating Menu / Back Button over map
        if (state.step != DriverStep.waitingForReply)
          Positioned(
            top: 16.h,
            left: 16.w,
            child: InkWell(
              onTap: () {
                if (state.step == DriverStep.requestDetails) {
                  cubit.skipRequest();
                } else if (state.step == DriverStep.customFare) {
                  cubit.closeCustomFare();
                } else {
                  _scaffoldKey.currentState?.openDrawer();
                }
              },
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowMedium,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  state.step == DriverStep.requestDetails
                      ? Icons.arrow_back
                      : Icons.menu,
                  color: AppColors.darkText,
                  size: 22.sp,
                ),
              ),
            ),
          ),

        // Floating request card or Keypad depending on state
        if (state.step == DriverStep.requestDetails)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DriverRequestDetailsSheet(state: state, cubit: cubit),
            ),
          )
        else if (state.step == DriverStep.customFare)
          Positioned.fill(
            child: DriverCustomKeypadSheet(state: state, cubit: cubit),
          )
        else if (state.step == DriverStep.waitingForReply)
          Positioned.fill(
            child: Stack(
              children: [
                DriverWaitingReplyOverlay(state: state, cubit: cubit),
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  child: InkWell(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadowMedium,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.menu,
                        color: AppColors.darkText,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        else if (state.step == DriverStep.tripAccepted ||
            state.step == DriverStep.tripStarted)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DriverTripAcceptedSheet(state: state, cubit: cubit),
          ),
      ],
    );
  }
}
