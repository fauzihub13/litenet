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
  final int onlineDevice;
  final int offlineDevice;
  final int inactiveDevice;

  const SummaryDataEntity({
    required this.totalDevice,
    required this.onlineDevice,
    required this.offlineDevice,
    required this.inactiveDevice,
  });
}
