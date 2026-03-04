// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_and_policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivacyAndPolicyResponseModel _$PrivacyAndPolicyResponseModelFromJson(
  Map<String, dynamic> json,
) => _PrivacyAndPolicyResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => PrivacyAndPolicyDataModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PrivacyAndPolicyResponseModelToJson(
  _PrivacyAndPolicyResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_PrivacyAndPolicyDataModel _$PrivacyAndPolicyDataModelFromJson(
  Map<String, dynamic> json,
) => _PrivacyAndPolicyDataModel(
  id: json['id'] as String?,
  slug: json['slug'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$PrivacyAndPolicyDataModelToJson(
  _PrivacyAndPolicyDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'title': instance.title,
  'description': instance.description,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
};
