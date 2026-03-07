// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_payment_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckPaymentStatusResponseModel _$CheckPaymentStatusResponseModelFromJson(
  Map<String, dynamic> json,
) => _CheckPaymentStatusResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CheckPaymentStatusDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CheckPaymentStatusResponseModelToJson(
  _CheckPaymentStatusResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_CheckPaymentStatusDataModel _$CheckPaymentStatusDataModelFromJson(
  Map<String, dynamic> json,
) => _CheckPaymentStatusDataModel(
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
  orderId: json['order_id'] as String?,
  transactionStatus: json['transaction_status'] as String?,
  fraudStatus: json['fraud_status'] as String?,
  bank: json['bank'] as String?,
  expiredAt: json['expired_at'] == null
      ? null
      : DateTime.parse(json['expired_at'] as String),
);

Map<String, dynamic> _$CheckPaymentStatusDataModelToJson(
  _CheckPaymentStatusDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'order_id': instance.orderId,
  'transaction_status': instance.transactionStatus,
  'fraud_status': instance.fraudStatus,
  'bank': instance.bank,
  'expired_at': instance.expiredAt?.toIso8601String(),
};
