class CheckPaymentStatusResponse {
  final bool success;
  final String message;
  final CheckPaymentStatusDataEntity data;

  const CheckPaymentStatusResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class CheckPaymentStatusDataEntity {
  final String id;
  final String userId;
  final String orderId;
  final String transactionStatus;
  final String fraudStatus;
  final String bank;
  final DateTime expiredAt;

  const CheckPaymentStatusDataEntity({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.transactionStatus,
    required this.fraudStatus,
    required this.bank,
    required this.expiredAt,
  });
}
