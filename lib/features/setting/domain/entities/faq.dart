class FAQResponse {
  final bool success;
  final String message;
  final List<FAQDataEntity> data;

  const FAQResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class FAQDataEntity {
  final String id;
  final String slug;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const FAQDataEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
