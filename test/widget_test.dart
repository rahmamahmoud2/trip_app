import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app/core/constants/app_strings.dart';
import 'package:trip_app/main.dart';

void main() {
  testWidgets('Onboarding initial screen displays title, subtitle and next button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TripApp());
    await tester.pumpAndSettle();

    // Verify first slide title is displayed
    expect(find.text(AppStrings.onboardingTitle1), findsOneWidget);

    // Verify Skip and Next buttons are displayed
    expect(find.text(AppStrings.skip), findsOneWidget);
    expect(find.text(AppStrings.next), findsOneWidget);
  });
}
