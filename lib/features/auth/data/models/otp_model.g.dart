// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OTP _$OTPFromJson(Map<String, dynamic> json) => _OTP(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : OTPDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OTPToJson(_OTP instance) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_OTPDataModel _$OTPDataModelFromJson(Map<String, dynamic> json) =>
    _OTPDataModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      isVerified: json['is_verified'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$OTPDataModelToJson(_OTPDataModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'is_verified': instance.isVerified,
      'token': instance.token,
    };
