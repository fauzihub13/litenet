import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_device_model.freezed.dart';
part 'history_device_model.g.dart';

@freezed
abstract class HistoryDeviceResponseModel with _$HistoryDeviceResponseModel {
  const factory HistoryDeviceResponseModel({
    bool? success,
    String? message,
    List<HistoryDeviceDataModel>? data,
  }) = _HistoryDeviceResponseModel;

  factory HistoryDeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryDeviceResponseModelFromJson(json);
}

@freezed
abstract class HistoryDeviceDataModel with _$HistoryDeviceDataModel {
  const factory HistoryDeviceDataModel({
    String? id,
    String? deviceId,
    String? kitSerialNumber,
    String? nodelink,
    String? name,
    double? latitude,
    double? longitude,
    String? detailAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HistoryDeviceDataModel;

  factory HistoryDeviceDataModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryDeviceDataModelFromJson(json);
}
