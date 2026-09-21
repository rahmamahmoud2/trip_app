import 'package:flutter/material.dart';
import '../constants/app_assets.dart';

/// Full-screen static map image used on passenger and driver home screens.
class AppMapBackground extends StatelessWidget {
  const AppMapBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.mapBackground,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: double.infinity,
      filterQuality: FilterQuality.medium,
      gaplessPlayback: true,
    );
  }
}
