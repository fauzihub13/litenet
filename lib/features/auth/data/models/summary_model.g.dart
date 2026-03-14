// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummaryResponseModel _$SummaryResponseModelFromJson(
  Map<String, dynamic> json,
) => _SummaryResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : SummaryDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SummaryResponseModelToJson(
  _SummaryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_SummaryDataModel _$SummaryDataModelFromJson(Map<String, dynamic> json) =>
    _SummaryDataModel(
      totalDevice: (json['total_device'] as num?)?.toInt(),
      onlineDevice: (json['online_device'] as num?)?.toInt(),
      offlineDevice: (json['offline_device'] as num?)?.toInt(),
      inactiveDevice: (json['inactive_device'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SummaryDataModelToJson(_SummaryDataModel instance) =>
    <String, dynamic>{
      'total_device': instance.totalDevice,
      'online_device': instance.onlineDevice,
      'offline_device': instance.offlineDevice,
      'inactive_device': instance.inactiveDevice,
    };
