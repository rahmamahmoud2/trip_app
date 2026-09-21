import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../passenger/views/passenger_home_screen.dart';
import '../models/onboarding_item_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  static const Duration animationDuration = Duration(milliseconds: 350);
  static const Curve animationCurve = Curves.easeInOut;

  /// Triggered when the user swipes the PageView
  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  /// Triggered when clicking the "Next" button
  void nextPage(PageController controller) {
    if (!state.isLastPage) {
      controller.nextPage(
        duration: animationDuration,
        curve: animationCurve,
      );
    }
  }

  /// Triggered when clicking the "Skip" button to jump to the final page
  void skip(PageController controller) {
    final int lastIndex = OnboardingItemModel.pages.length - 1;
    controller.animateToPage(
      lastIndex,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  /// Triggered when clicking "Sign Up / Log In" on the last page
  void onAuthAction(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const PassengerHomeScreen(),
      ),
    );
  }
}
