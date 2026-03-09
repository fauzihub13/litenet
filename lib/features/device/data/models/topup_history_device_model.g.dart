// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_history_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopupHistoryDeviceResponseModel _$TopupHistoryDeviceResponseModelFromJson(
  Map<String, dynamic> json,
) => _TopupHistoryDeviceResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => TopupHistoryDeviceDataModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TopupHistoryDeviceResponseModelToJson(
  _TopupHistoryDeviceResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_TopupHistoryDeviceDataModel _$TopupHistoryDeviceDataModelFromJson(
  Map<String, dynamic> json,
) => _TopupHistoryDeviceDataModel(
  id: json['id'] as String?,
  deviceId: json['device_id'] as String?,
  dataPlanId: json['data_plan_id'] as String?,
  startAt: json['start_at'] == null
      ? null
      : DateTime.parse(json['start_at'] as String),
  endAt: json['end_at'] == null
      ? null
      : DateTime.parse(json['end_at'] as String),
  price: (json['price'] as num?)?.toInt(),
  packageName: json['package_name'] as String?,
  capacity: json['capacity'] as String?,
  quotaTotal: (json['quota_total'] as num?)?.toInt(),
  quotaUsed: (json['quota_used'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$TopupHistoryDeviceDataModelToJson(
  _TopupHistoryDeviceDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'device_id': instance.deviceId,
  'data_plan_id': instance.dataPlanId,
  'start_at': instance.startAt?.toIso8601String(),
  'end_at': instance.endAt?.toIso8601String(),
  'price': instance.price,
  'package_name': instance.packageName,
  'capacity': instance.capacity,
  'quota_total': instance.quotaTotal,
  'quota_used': instance.quotaUsed,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
};
