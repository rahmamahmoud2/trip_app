import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/features/passenger/matching/views/driver_offers_sheet.dart';
import 'package:trip_app/features/passenger/matching/views/finding_driver_sheet.dart';
import '../cubit/passenger_cubit.dart';
import '../cubit/passenger_state.dart';

import '../drawer/views/passenger_drawer.dart';
import 'widgets/passenger_map_view.dart';
import '../ride/views/ride_selection_sheet.dart';
import '../ride/views/route_preview_sheet.dart';

class PassengerHomeScreen extends StatelessWidget {
  const PassengerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(),
      child: const _PassengerHomeScreenBody(),
    );
  }
}

class _PassengerHomeScreenBody extends StatefulWidget {
  const _PassengerHomeScreenBody();

  @override
  State<_PassengerHomeScreenBody> createState() =>
      _PassengerHomeScreenBodyState();
}

class _PassengerHomeScreenBodyState extends State<_PassengerHomeScreenBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PassengerCubit>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const PassengerDrawer(),
      body: BlocBuilder<PassengerCubit, PassengerState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Interactive Map View
              Positioned.fill(child: PassengerMapView(state: state)),

              // Floating Hamburger Menu Button
              Positioned(
                top: 16.h,
                left: 16.w,
                child: SafeArea(
                  child: Material(
                    color: AppColors.white,
                    shape: const CircleBorder(),
                    elevation: 4,
                    shadowColor: AppColors.shadowFloating,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(
                          Icons.menu,
                          size: 22.sp,
                          color: AppColors.darkText,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Dynamic Bottom Sheet / Full overlay
              if (state.bookingStep == PassengerBookingStep.driverOffers)
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: DriverOffersSheet(
                      key: const ValueKey('sheet_driver_offers'),
                      state: state,
                      cubit: cubit,
                    ),
                  ),
                )
              else
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: _buildCurrentSheet(state, cubit),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCurrentSheet(PassengerState state, PassengerCubit cubit) {
    switch (state.bookingStep) {
      case PassengerBookingStep.selectRide:
        return RideSelectionSheet(
          key: const ValueKey('sheet_select_ride'),
          state: state,
          cubit: cubit,
        );
      case PassengerBookingStep.routePreview:
        return RoutePreviewSheet(
          key: const ValueKey('sheet_route_preview'),
          state: state,
          cubit: cubit,
        );
      case PassengerBookingStep.findingDriver:
        return FindingDriverSheet(
          key: const ValueKey('sheet_finding_driver'),
          state: state,
          cubit: cubit,
        );
      case PassengerBookingStep.driverOffers:
        throw StateError('driverOffers is rendered as a full-screen overlay');
    }
  }
}
