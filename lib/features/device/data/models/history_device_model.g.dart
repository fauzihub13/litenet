// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryDeviceResponseModel _$HistoryDeviceResponseModelFromJson(
  Map<String, dynamic> json,
) => _HistoryDeviceResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => HistoryDeviceDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryDeviceResponseModelToJson(
  _HistoryDeviceResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_HistoryDeviceDataModel _$HistoryDeviceDataModelFromJson(
  Map<String, dynamic> json,
) => _HistoryDeviceDataModel(
  id: json['id'] as String?,
  deviceId: json['device_id'] as String?,
  kitSerialNumber: json['kit_serial_number'] as String?,
  nodelink: json['nodelink'] as String?,
  name: json['name'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  detailAddress: json['detail_address'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$HistoryDeviceDataModelToJson(
  _HistoryDeviceDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'device_id': instance.deviceId,
  'kit_serial_number': instance.kitSerialNumber,
  'nodelink': instance.nodelink,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'detail_address': instance.detailAddress,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
