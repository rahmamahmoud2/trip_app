import 'package:trip_app/core/constants/app_assets.dart';
import 'package:trip_app/core/constants/app_strings.dart';

enum DriverTransactionType { fawry, card, paypal }

class DriverTransactionModel {
  final String title;
  final String time;
  final String amount;
  final DriverTransactionType type;

  const DriverTransactionModel({
    required this.title,
    required this.time,
    required this.amount,
    required this.type,
  });

  String get iconAsset {
    switch (type) {
      case DriverTransactionType.fawry:
        return AppAssets.fawryLogo;
      case DriverTransactionType.card:
        return AppAssets.cardLogo;
      case DriverTransactionType.paypal:
        return AppAssets.paypalLogo;
    }
  }
}

class DriverWalletData {
  final double balance;
  final double earnedToday;
  final Map<String, List<DriverTransactionModel>> groupedTransactions;

  const DriverWalletData({
    required this.balance,
    required this.earnedToday,
    required this.groupedTransactions,
  });

  static const DriverWalletData mockData = DriverWalletData(
    balance: 0.00,
    earnedToday: 250.0,
    groupedTransactions: {
      AppStrings.today: [
        DriverTransactionModel(
          title: AppStrings.fawryTransfer,
          time: '06:00 PM',
          amount: '+EGP 100',
          type: DriverTransactionType.fawry,
        ),
        DriverTransactionModel(
          title: AppStrings.cardDeposit,
          time: '04:30 PM',
          amount: '+EGP 100',
          type: DriverTransactionType.card,
        ),
      ],
      AppStrings.yesterday19June: [
        DriverTransactionModel(
          title: AppStrings.paypalTransfer,
          time: '02:00 PM',
          amount: '+EGP 100',
          type: DriverTransactionType.paypal,
        ),
        DriverTransactionModel(
          title: AppStrings.fawryTransfer,
          time: '01:00 PM',
          amount: '+EGP 100',
          type: DriverTransactionType.fawry,
        ),
      ],
    },
  );
}
