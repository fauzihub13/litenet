// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodResponseModel _$PaymentMethodResponseModelFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => PaymentMethodDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaymentMethodResponseModelToJson(
  _PaymentMethodResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_PaymentMethodDataModel _$PaymentMethodDataModelFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodDataModel(
  id: json['id'] as String?,
  code: json['code'] as String?,
  name: json['name'] as String?,
  type: json['type'] as String?,
  provider: json['provider'] as String?,
  image: json['image'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$PaymentMethodDataModelToJson(
  _PaymentMethodDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'type': instance.type,
  'provider': instance.provider,
  'image': instance.image,
  'is_active': instance.isActive,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'image_url': instance.imageUrl,
};
