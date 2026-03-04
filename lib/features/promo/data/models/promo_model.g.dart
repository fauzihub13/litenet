// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromoResponseModel _$PromoResponseModelFromJson(Map<String, dynamic> json) =>
    _PromoResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PromoDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromoResponseModelToJson(_PromoResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_PromoDataModel _$PromoDataModelFromJson(Map<String, dynamic> json) =>
    _PromoDataModel(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      minimumTransaction: (json['minimum_transaction'] as num?)?.toInt(),
      maxDiscount: (json['max_discount'] as num?)?.toInt(),
      promoCode: json['promo_code'] as String?,
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      endAt: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$PromoDataModelToJson(_PromoDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'minimum_transaction': instance.minimumTransaction,
      'max_discount': instance.maxDiscount,
      'promo_code': instance.promoCode,
      'start_at': instance.startAt?.toIso8601String(),
      'end_at': instance.endAt?.toIso8601String(),
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
