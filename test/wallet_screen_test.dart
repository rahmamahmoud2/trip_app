import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/features/passenger/views/passenger_home_screen.dart';
import 'package:trip_app/features/passenger/wallet/views/wallet_screen.dart';

void main() {
  testWidgets('WalletScreen pumps without error', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => const MaterialApp(home: WalletScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(WalletScreen), findsOneWidget);
  });

  testWidgets('Navigating to WalletScreen from home drawer works', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) =>
            const MaterialApp(home: PassengerHomeScreen()),
      ),
    );
    await tester.pumpAndSettle();

    // Open drawer
    final scaffoldState = tester.firstState<ScaffoldState>(
      find.byType(Scaffold),
    );
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    // Find Wallet item in drawer
    final walletItem = find.text('Wallet');
    expect(walletItem, findsOneWidget);
    await tester.tap(walletItem);
    await tester.pumpAndSettle();

    expect(find.byType(WalletScreen), findsOneWidget);
  });
}
