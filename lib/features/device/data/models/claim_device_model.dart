import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_device_model.freezed.dart';
part 'claim_device_model.g.dart';

@freezed
abstract class ClaimDeviceResponseModel
    with _$ClaimDeviceResponseModel {
  const factory ClaimDeviceResponseModel({
    bool? success,
    String? message,
  }) = _ClaimDeviceResponseModel;

  factory ClaimDeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimDeviceResponseModelFromJson(json);
}