import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/driver_request_model.dart';
import 'driver_request_info_row.dart';

class DriverRequestCard extends StatelessWidget {
  final DriverRequestModel request;
  final VoidCallback onTap;

  const DriverRequestCard({
    super.key,
    required this.request,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: DriverRequestInfoRow(request: request),
      ),
    );
  }
}
