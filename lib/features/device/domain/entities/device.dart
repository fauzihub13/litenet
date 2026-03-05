class DeviceResponse {
  final bool success;
  final String message;
  final List<DeviceDataEntity> data;

  const DeviceResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class DeviceDataEntity {
  final String deviceId;
  final String userId;
  final String userName;
  final String name;
  final String kitSerialNumber;
  final String nodelink;
  final String address;
  final double latitude;
  final double longitude;
  final String status;
  final int quotaTotal;
  final int quotaUsed;
  final int quotaLeft;
  final DateTime activeSince;
  final dynamic activeUntil;
  final dynamic dataPlan;

  const DeviceDataEntity({
    required this.deviceId,
    required this.userId,
    required this.userName,
    required this.name,
    required this.kitSerialNumber,
    required this.nodelink,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.quotaTotal,
    required this.quotaUsed,
    required this.quotaLeft,
    required this.activeSince,
    required this.activeUntil,
    required this.dataPlan,
  });
}
