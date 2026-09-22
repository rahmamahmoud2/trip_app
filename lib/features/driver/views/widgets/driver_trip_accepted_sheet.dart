import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/constants/app_colors.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import '../../cubit/driver_cubit.dart';
import '../../cubit/driver_state.dart';
import '../../models/driver_request_model.dart';
import 'driver_request_info_row.dart';

class DriverTripAcceptedSheet extends StatefulWidget {
  final DriverState state;
  final DriverCubit cubit;

  const DriverTripAcceptedSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  State<DriverTripAcceptedSheet> createState() =>
      _DriverTripAcceptedSheetState();
}

class _DriverTripAcceptedSheetState extends State<DriverTripAcceptedSheet> {
  double _dragPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    final request =
        widget.state.selectedRequest ?? DriverRequestModel.mockRequests.first;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowFloating,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DriverRequestInfoRow(
            request: request,
            offerProgress: widget.state.offerProgress,
          ),
          SizedBox(height: 14.h),
          _PickupTimeBanner(pickupTime: request.pickupTime),
          SizedBox(height: 14.h),
          _SwipeToStartButton(
            dragPosition: _dragPosition,
            onDragUpdate: (delta) {
              setState(() {
                _dragPosition += delta;
                if (_dragPosition < 0) _dragPosition = 0;
              });
            },
            onDragEnd: (maxOffset) {
              if (_dragPosition >= maxOffset * 0.65) {
                setState(() => _dragPosition = maxOffset);
                widget.cubit.startTrip();
              } else {
                setState(() => _dragPosition = 0.0);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _PickupTimeBanner extends StatelessWidget {
  final String pickupTime;

  const _PickupTimeBanner({required this.pickupTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.pickupTimeBg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.access_time_filled,
            size: 16.sp,
            color: AppColors.primary,
          ),
          SizedBox(width: 8.w),
          Text(
            'Pickup time: ~ $pickupTime',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SwipeToStartButton extends StatelessWidget {
  final double dragPosition;
  final ValueChanged<double> onDragUpdate;
  final ValueChanged<double> onDragEnd;

  const _SwipeToStartButton({
    required this.dragPosition,
    required this.onDragUpdate,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final handleWidth = 48.w;
        final maxOffset = availableWidth - handleWidth - 4.w;
        final clampedDrag = dragPosition.clamp(0.0, maxOffset);

        return Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                AppStrings.swapToStartTrip,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              Positioned(
                right: (maxOffset - clampedDrag) + 2.w,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    onDragUpdate(-details.delta.dx);
                  },
                  onHorizontalDragEnd: (_) => onDragEnd(maxOffset),
                  child: SizedBox(
                    width: handleWidth,
                    height: 48.h,
                    child: Icon(
                      Icons.keyboard_double_arrow_right,
                      color: AppColors.white,
                      size: 28.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
