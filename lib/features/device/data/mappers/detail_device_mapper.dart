import 'package:litenet/features/device/data/mappers/device_mapper.dart';
import 'package:litenet/features/device/data/models/detail_device_model.dart';
import 'package:litenet/features/device/data/models/device_model.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';

extension DetailDeviceResponseModelMapper on DetailDeviceResponseModel {
  DetailDeviceResponse toEntity() {
    return DetailDeviceResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? DeviceDataModel()).toEntity(),
    );
  }
}
