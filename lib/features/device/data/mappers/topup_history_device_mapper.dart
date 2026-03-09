import 'package:litenet/features/device/data/models/topup_history_device_model.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';

extension TopupHistoryDeviceResponseModelMapper
    on TopupHistoryDeviceResponseModel {
  TopupHistoryDeviceResponse toEntity() {
    return TopupHistoryDeviceResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension TopupHistoryDeviceDataModelMapper on TopupHistoryDeviceDataModel {
  TopupHistoryDeviceDataEntity toEntity() {
    return TopupHistoryDeviceDataEntity(
      id: id ?? '-',
      deviceId: deviceId ?? '-',
      dataPlanId: dataPlanId ?? '-',
      startAt: startAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      endAt: endAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      price: price ?? 0,
      packageName: packageName ?? '-',
      capacity: capacity ?? '-',
      quotaTotal: quotaTotal ?? 0,
      quotaUsed: quotaUsed ?? 0,
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
