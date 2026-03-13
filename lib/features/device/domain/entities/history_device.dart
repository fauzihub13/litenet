class HistoryDeviceResponse {
  final bool success;
  final String message;
  final List<HistoryDeviceDataEntity> data;

  const HistoryDeviceResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class HistoryDeviceDataEntity {
  final String id;
  final String deviceId;
  final String kitSerialNumber;
  final String nodelink;
  final String name;
  final double latitude;
  final double longitude;
  final String detailAddress;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HistoryDeviceDataEntity({
    required this.id,
    required this.deviceId,
    required this.kitSerialNumber,
    required this.nodelink,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.detailAddress,
    required this.createdAt,
    required this.updatedAt,
  });
}
