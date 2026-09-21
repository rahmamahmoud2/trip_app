import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app/features/driver/views/driver_home_screen.dart';
import 'package:trip_app/features/driver/wallet/views/driver_wallet_screen.dart';

void main() {
  testWidgets('DriverHomeScreen renders requests feed and opens drawer', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => const MaterialApp(
          home: DriverHomeScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(DriverHomeScreen), findsOneWidget);
    expect(find.text('Online'), findsOneWidget);
    expect(find.text('Offline'), findsOneWidget);

    // Open drawer
    final scaffoldState = tester.firstState<ScaffoldState>(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Rides'), findsOneWidget);
    expect(find.text('Wallet'), findsOneWidget);

    await tester.tap(find.text('Wallet'));
    await tester.pumpAndSettle();

    expect(find.byType(DriverWalletScreen), findsOneWidget);
  });

  testWidgets('DriverWalletScreen renders balance, earned today and transactions', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => const MaterialApp(
          home: DriverWalletScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(DriverWalletScreen), findsOneWidget);
    expect(find.text('TripU Cash'), findsOneWidget);
    expect(find.text('EARNED TODAY'), findsOneWidget);
    expect(find.text('+ 250 EGP'), findsOneWidget);
  });
}
