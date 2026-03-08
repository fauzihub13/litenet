class DetailTransactionResponse {
  final bool success;
  final String message;
  final DetailTransactionDataEntity data;

  const DetailTransactionResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class DetailTransactionDataEntity {
  final String id;
  final String orderId;
  final String packageName;
  final String capacity;
  final String transactionStatus;
  final int grossAmount;
  final String bankCode;
  final String bankName;
  final String bankImageUrl;
  final String vaNumber;
  final DateTime createdAt;
  final DateTime expiredAt;

  const DetailTransactionDataEntity({
    required this.id,
    required this.orderId,
    required this.packageName,
    required this.capacity,
    required this.transactionStatus,
    required this.grossAmount,
    required this.bankCode,
    required this.bankName,
    required this.bankImageUrl,
    required this.vaNumber,
    required this.createdAt,
    required this.expiredAt,
  });
}
