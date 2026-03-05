// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailDeviceResponseModel _$DetailDeviceResponseModelFromJson(
  Map<String, dynamic> json,
) => _DetailDeviceResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DeviceDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetailDeviceResponseModelToJson(
  _DetailDeviceResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
