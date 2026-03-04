// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClaimDeviceResponseModel _$ClaimDeviceResponseModelFromJson(
  Map<String, dynamic> json,
) => _ClaimDeviceResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ClaimDeviceResponseModelToJson(
  _ClaimDeviceResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
