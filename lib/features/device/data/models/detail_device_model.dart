import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:litenet/features/device/data/models/device_model.dart';

part 'detail_device_model.freezed.dart';
part 'detail_device_model.g.dart';

@freezed
abstract class DetailDeviceResponseModel with _$DetailDeviceResponseModel {
  const factory DetailDeviceResponseModel({
    bool? success,
    String? message,
    DeviceDataModel? data,
  }) = _DetailDeviceResponseModel;

  factory DetailDeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailDeviceResponseModelFromJson(json);
}
