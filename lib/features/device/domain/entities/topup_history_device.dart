class TopupHistoryDeviceResponse {
  final bool success;
  final String message;
  final List<TopupHistoryDeviceDataEntity> data;

  const TopupHistoryDeviceResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class TopupHistoryDeviceDataEntity {
  final String id;
  final String deviceId;
  final String dataPlanId;
  final DateTime startAt;
  final DateTime endAt;
  final int price;
  final String packageName;
  final String capacity;
  final int quotaTotal;
  final int quotaUsed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const TopupHistoryDeviceDataEntity({
    required this.id,
    required this.deviceId,
    required this.dataPlanId,
    required this.startAt,
    required this.endAt,
    required this.price,
    required this.packageName,
    required this.capacity,
    required this.quotaTotal,
    required this.quotaUsed,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
