class PrivacyAndPolicyResponse {
  final bool success;
  final String message;
  final List<PrivacyAndPolicyDataEntity> data;

  const PrivacyAndPolicyResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class PrivacyAndPolicyDataEntity {
  final String id;
  final String slug;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const PrivacyAndPolicyDataEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
