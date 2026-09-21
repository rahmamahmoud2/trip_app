import 'package:flutter/material.dart';
import '../../../../core/widgets/app_map_background.dart';
import '../../cubit/passenger_state.dart';

class PassengerMapView extends StatelessWidget {
  final PassengerState state;

  const PassengerMapView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: AppMapBackground());
  }
}
