import 'package:litenet/features/device/domain/entities/device.dart';

class DetailDeviceResponse {
  final bool success;
  final String message;
  final DeviceDataEntity data;

  const DetailDeviceResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}
