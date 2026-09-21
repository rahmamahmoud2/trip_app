import 'package:flutter/material.dart';
import 'package:trip_app/core/widgets/app_map_background.dart';

class DriverMapView extends StatelessWidget {
  const DriverMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: AppMapBackground());
  }
}
