class TransactionResponse {
  final bool success;
  final String message;
  final List<TransactionDataEntity> data;

  const TransactionResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class TransactionDataEntity {
  final String id;
  final String orderId;
  final String packageName;
  final String capacity;
  final String transactionStatus;
  final int grossAmount;
  final DateTime createdAt;

  const TransactionDataEntity({
    required this.id,
    required this.orderId,
    required this.packageName,
    required this.capacity,
    required this.transactionStatus,
    required this.grossAmount,
    required this.createdAt,
  });
}
