import 'package:litenet/features/device/data/models/claim_device_model.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';

extension ClaimDeviceResponseModelMapper on ClaimDeviceResponseModel {
  ClaimDeviceResponse toEntity() {
    return ClaimDeviceResponse(
      success: success ?? false,
      message: message ?? '-',
    );
  }
}
