import 'package:freezed_annotation/freezed_annotation.dart';

part 'topup_history_device_model.freezed.dart';
part 'topup_history_device_model.g.dart';

@freezed
abstract class TopupHistoryDeviceResponseModel
    with _$TopupHistoryDeviceResponseModel {
  const factory TopupHistoryDeviceResponseModel({
    bool? success,
    String? message,
    List<TopupHistoryDeviceDataModel>? data,
  }) = _TopupHistoryDeviceResponseModel;

  factory TopupHistoryDeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryDeviceResponseModelFromJson(json);
}

@freezed
abstract class TopupHistoryDeviceDataModel with _$TopupHistoryDeviceDataModel {
  const factory TopupHistoryDeviceDataModel({
    String? id,
    String? deviceId,
    String? dataPlanId,
    DateTime? startAt,
    DateTime? endAt,
    int? price,
    String? packageName,
    String? capacity,
    int? quotaTotal,
    int? quotaUsed,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) = _TopupHistoryDeviceDataModel;

  factory TopupHistoryDeviceDataModel.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryDeviceDataModelFromJson(json);
}
