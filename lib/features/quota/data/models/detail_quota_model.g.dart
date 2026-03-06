// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_quota_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailQuotaResponseModel _$DetailQuotaResponseModelFromJson(
  Map<String, dynamic> json,
) => _DetailQuotaResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DetailQuotaDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetailQuotaResponseModelToJson(
  _DetailQuotaResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_DetailQuotaDataModel _$DetailQuotaDataModelFromJson(
  Map<String, dynamic> json,
) => _DetailQuotaDataModel(
  id: json['id'] as String?,
  code: json['code'] as String?,
  slug: json['slug'] as String?,
  name: json['name'] as String?,
  quota: (json['quota'] as num?)?.toInt(),
  monthDuration: (json['month_duration'] as num?)?.toInt(),
  basePrice: (json['base_price'] as num?)?.toInt(),
  promoPrice: (json['promo_price'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  capacity: json['capacity'] as String?,
  isPromo: json['is_promo'] as bool?,
  description: json['description'] as String?,
  terms: (json['terms'] as List<dynamic>?)?.map((e) => e as String).toList(),
  devices: (json['devices'] as List<dynamic>?)
      ?.map((e) => DeviceQuotaDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DetailQuotaDataModelToJson(
  _DetailQuotaDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'slug': instance.slug,
  'name': instance.name,
  'quota': instance.quota,
  'month_duration': instance.monthDuration,
  'base_price': instance.basePrice,
  'promo_price': instance.promoPrice,
  'discount': instance.discount,
  'capacity': instance.capacity,
  'is_promo': instance.isPromo,
  'description': instance.description,
  'terms': instance.terms,
  'devices': instance.devices,
};

_DeviceQuotaDataModel _$DeviceQuotaDataModelFromJson(
  Map<String, dynamic> json,
) => _DeviceQuotaDataModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$DeviceQuotaDataModelToJson(
  _DeviceQuotaDataModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
