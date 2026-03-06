// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_promo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckPromoResponseModel _$CheckPromoResponseModelFromJson(
  Map<String, dynamic> json,
) => _CheckPromoResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : PromoDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CheckPromoResponseModelToJson(
  _CheckPromoResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
