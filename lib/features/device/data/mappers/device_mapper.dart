import 'package:litenet/features/device/data/models/device_model.dart';
import 'package:litenet/features/device/domain/entities/device.dart';

extension DeviceResponseModelMapper on DeviceResponseModel {
  DeviceResponse toEntity() {
    return DeviceResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension DeviceDataModelMapper on DeviceDataModel {
  DeviceDataEntity toEntity() {
    return DeviceDataEntity(
      deviceId: deviceId ?? '-',
      userId: userId ?? '-',
      userName: userName ?? '-',
      name: name ?? '-',
      kitSerialNumber: kitSerialNumber ?? '-',
      nodelink: nodelink ?? '-',
      address: address ?? '-',
      latitude: latitude ?? 0,
      longitude: longitude ?? 0,
      status: status ?? '-',
      quotaTotal: quotaTotal ?? 0,
      quotaUsed: quotaUsed ?? 0,
      quotaLeft: quotaLeft ?? 0,
      activeSince: activeSince ?? DateTime.fromMillisecondsSinceEpoch(0),
      activeUntil: activeUntil ?? '-',
      dataPlan: dataPlan,
    );
  }
}
