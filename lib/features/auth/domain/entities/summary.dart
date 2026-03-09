// .dart
class SummaryResponse {
  final bool success;
  final String message;
  final SummaryDataEntity data;

  const SummaryResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

// dart
class SummaryDataEntity {
  final int totalDevice;
  final String totalQuota;
  final String totalUsage;

  const SummaryDataEntity({
    required this.totalDevice,
    required this.totalQuota,
    required this.totalUsage,
  });
}
