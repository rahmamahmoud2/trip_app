enum TransactionType { fawry, card, paypal }

class WalletTransactionModel {
  final String id;
  final String title;
  final String time;
  final int amount;
  final bool isCredit; // true for +, false for -
  final TransactionType type;

  const WalletTransactionModel({
    required this.id,
    required this.title,
    required this.time,
    required this.amount,
    required this.isCredit,
    required this.type,
  });

  static const List<WalletTransactionModel> todayTransactions = [
    WalletTransactionModel(
      id: 'tx_1',
      title: 'Fawry Transfer',
      time: '06:00 PM',
      amount: 100,
      isCredit: true,
      type: TransactionType.fawry,
    ),
    WalletTransactionModel(
      id: 'tx_2',
      title: 'Card Deposit',
      time: '01:00 AM',
      amount: 100,
      isCredit: true,
      type: TransactionType.card,
    ),
  ];

  static const List<WalletTransactionModel> previousTransactions = [
    WalletTransactionModel(
      id: 'tx_3',
      title: 'PayPal Transfer',
      time: '06:00 PM',
      amount: 100,
      isCredit: true,
      type: TransactionType.paypal,
    ),
    WalletTransactionModel(
      id: 'tx_4',
      title: 'Fawry Transfer',
      time: '06:00 PM',
      amount: 100,
      isCredit: true,
      type: TransactionType.fawry,
    ),
  ];
}
