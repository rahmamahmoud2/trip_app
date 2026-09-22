import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF1C64F2);
  static const Color primary600 = Color(0xFF1C64F2);
  static const Color primaryDark = Color(0xFF1550C0);
  static const Color primaryLight = Color(0xFFEBF2FE);

  // Base =
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Typography Colors
  static const Color darkText = Color(0xFF111928);
  static const Color grayText = Color(0xFF6B7280);
  static const Color grey = Color(0xFF6B7280);
  static const Color subtitleText = Color(0xD9FFFFFF);

  // Background & Borders
  static const Color lightGrayBg = Color(0xFFF9FAFB);
  static const Color selectedItemBg = Color(0xFFF3F4F6);
  static const Color borderGray = Color(0xFFE5E7EB);
  static const Color dividerColor = Color(0xFFF3F4F6);

  // Status
  static const Color accentGreen = Color(0xFF0E9F6E);
  static const Color starYellow = Color(0xFFFACA15);
  static const Color dangerRed = Color.fromARGB(255, 245, 114, 114);

  // Onboarding & Buttons
  static const Color indicatorInactive = Color(0x66FFFFFF);
  static const Color indicatorActive = Color(0xFFFFFFFF);
  static const Color buttonBg = Color(0xFFFFFFFF);
  static const Color buttonText = Color(0xFF1C64F2);

  // Shadows
  static const Color shadowLight = Color(0x0A000000);
  static const Color shadowMedium = Color(0x14000000);
  static const Color shadowDark = Color(0x26000000);
  static const Color shadowFloating = Color(0x40000000);

  // Wallet
  static const Color walletGradientStart = Color(0xFF689BF9);
  static const Color walletGradientEnd = Color(0xFF1C64F2);
  static const Color walletShadow = Color(0x591C64F2);
  static const Color walletCardStart = Color(0xFF8BAEF8);
  static const Color walletCardEnd = Color(0xFF9DB9F9);
  static const Color walletCardShape = Color(0x33FFFFFF);

  // Driver Feature Colors
  static const Color overlayDark = Color(0xCC000000);
  static const Color earnedGreenBg = Color(0xFFDEF7EC);
  static const Color earnedGreenText = Color(0xFF03543F);
  static const Color keypadBg = Color(0xFFF3F4F6);
  static const Color pickupTimeBg = Color(0xFFEBF5FF);
}
