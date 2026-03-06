class QuotaResponse {
  final bool success;
  final String message;
  final List<QuotaDataEntity> data;

  const QuotaResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class QuotaDataEntity {
  final String id;
  final String code;
  final String slug;
  final String name;
  final int quota;
  final int monthDuration;
  final String description;
  final int basePrice;
  final int promoPrice;
  final int discount;
  final String capacity;
  final bool isPromo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const QuotaDataEntity({
    required this.id,
    required this.code,
    required this.slug,
    required this.name,
    required this.quota,
    required this.monthDuration,
    required this.description,
    required this.basePrice,
    required this.promoPrice,
    required this.discount,
    required this.capacity,
    required this.isPromo,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
