class CreateTransactionResponse {
  final bool success;
  final String message;
  final CreateTransactionDataEntity data;

  const CreateTransactionResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class CreateTransactionDataEntity {
  final String orderId;
  final int amount;
  final String paymentType;
  final String bank;
  final String imageUrl;
  final String vaNumber;
  final DateTime expiredAt;

  const CreateTransactionDataEntity({
    required this.orderId,
    required this.amount,
    required this.paymentType,
    required this.bank,
    required this.imageUrl,
    required this.vaNumber,
    required this.expiredAt,
  });
}
