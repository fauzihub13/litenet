class PromoResponse {
  final bool success;
  final String message;
  final List<PromoDataEntity> data;

  const PromoResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class PromoDataEntity {
  final String id;
  final String slug;
  final String title;
  final int minimumTransaction;
  final int maxDiscount;
  final String promoCode;
  final DateTime startAt;
  final DateTime endAt;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const PromoDataEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.minimumTransaction,
    required this.maxDiscount,
    required this.promoCode,
    required this.startAt,
    required this.endAt,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
