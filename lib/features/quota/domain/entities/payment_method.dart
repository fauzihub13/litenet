class PaymentMethodResponse {
  final bool success;
  final String message;
  final List<PaymentMethodDataEntity> data;

  const PaymentMethodResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class PaymentMethodDataEntity {
  final String id;
  final String code;
  final String name;
  final String type;
  final String provider;
  final String image;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String imageUrl;

  const PaymentMethodDataEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.provider,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.imageUrl,
  });
}
