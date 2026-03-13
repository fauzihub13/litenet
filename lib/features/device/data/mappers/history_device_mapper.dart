import 'package:litenet/features/device/data/models/history_device_model.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';

extension HistoryDeviceResponseModelMapper on HistoryDeviceResponseModel {
  HistoryDeviceResponse toEntity() {
    return HistoryDeviceResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension HistoryDeviceDataModelMapper on HistoryDeviceDataModel {
  HistoryDeviceDataEntity toEntity() {
    return HistoryDeviceDataEntity(
      id: id ?? '-',
      deviceId: deviceId ?? '-',
      kitSerialNumber: kitSerialNumber ?? '-',
      nodelink: nodelink ?? '-',
      name: name ?? '-',
      latitude: latitude ?? 0,
      longitude: longitude ?? 0,
      detailAddress: detailAddress ?? '-',
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
