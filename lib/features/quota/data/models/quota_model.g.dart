// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quota_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuotaResponseModel _$QuotaResponseModelFromJson(Map<String, dynamic> json) =>
    _QuotaResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuotaDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuotaResponseModelToJson(_QuotaResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_QuotaDataModel _$QuotaDataModelFromJson(Map<String, dynamic> json) =>
    _QuotaDataModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      quota: (json['quota'] as num?)?.toInt(),
      monthDuration: (json['month_duration'] as num?)?.toInt(),
      description: json['description'] as String?,
      basePrice: (json['base_price'] as num?)?.toInt(),
      promoPrice: (json['promo_price'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      capacity: json['capacity'] as String?,
      isPromo: json['is_promo'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$QuotaDataModelToJson(_QuotaDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'slug': instance.slug,
      'name': instance.name,
      'quota': instance.quota,
      'month_duration': instance.monthDuration,
      'description': instance.description,
      'base_price': instance.basePrice,
      'promo_price': instance.promoPrice,
      'discount': instance.discount,
      'capacity': instance.capacity,
      'is_promo': instance.isPromo,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
