// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceResponseModel _$DeviceResponseModelFromJson(Map<String, dynamic> json) =>
    _DeviceResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DeviceDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceResponseModelToJson(
  _DeviceResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_DeviceDataModel _$DeviceDataModelFromJson(Map<String, dynamic> json) =>
    _DeviceDataModel(
      deviceId: json['device_id'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      name: json['name'] as String?,
      kitSerialNumber: json['kit_serial_number'] as String?,
      nodelink: json['nodelink'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      status: json['status'] as String?,
      quotaTotal: (json['quota_total'] as num?)?.toInt(),
      quotaUsed: (json['quota_used'] as num?)?.toInt(),
      quotaLeft: (json['quota_left'] as num?)?.toInt(),
      activeSince: json['active_since'] == null
          ? null
          : DateTime.parse(json['active_since'] as String),
      activeUntil: json['active_until'],
      dataPlan: json['data_plan'],
    );

Map<String, dynamic> _$DeviceDataModelToJson(_DeviceDataModel instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'name': instance.name,
      'kit_serial_number': instance.kitSerialNumber,
      'nodelink': instance.nodelink,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'quota_total': instance.quotaTotal,
      'quota_used': instance.quotaUsed,
      'quota_left': instance.quotaLeft,
      'active_since': instance.activeSince?.toIso8601String(),
      'active_until': instance.activeUntil,
      'data_plan': instance.dataPlan,
    };
