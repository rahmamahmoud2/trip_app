import '../models/onboarding_item_model.dart';

class OnboardingState {
  final int currentPage;

  const OnboardingState({this.currentPage = 0});

  bool get isLastPage => currentPage == OnboardingItemModel.pages.length - 1;

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingState &&
          runtimeType == other.runtimeType &&
          currentPage == other.currentPage;

  @override
  int get hashCode => currentPage.hashCode;
}
