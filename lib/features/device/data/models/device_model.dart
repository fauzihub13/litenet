import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
abstract class DeviceResponseModel with _$DeviceResponseModel {
  const factory DeviceResponseModel({
    bool? success,
    String? message,
    List<DeviceDataModel>? data,
  }) = _DeviceResponseModel;

  factory DeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceResponseModelFromJson(json);
}

@freezed
abstract class DeviceDataModel with _$DeviceDataModel {
  const factory DeviceDataModel({
    String? deviceId,
    String? userId,
    String? userName,
    String? name,
    String? kitSerialNumber,
    String? nodelink,
    String? address,
    double? latitude,
    double? longitude,
    String? status,
    int? quotaTotal,
    int? quotaUsed,
    int? quotaLeft,
    DateTime? activeSince,
    dynamic activeUntil,
    dynamic dataPlan,
  }) = _DeviceDataModel;

  factory DeviceDataModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataModelFromJson(json);
}
