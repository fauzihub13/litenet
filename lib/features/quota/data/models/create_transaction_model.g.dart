// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransactionResponseModel _$CreateTransactionResponseModelFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CreateTransactionDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CreateTransactionResponseModelToJson(
  _CreateTransactionResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_CreateTransactionDataModel _$CreateTransactionDataModelFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionDataModel(
  orderId: json['order_id'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  paymentType: json['payment_type'] as String?,
  bank: json['bank'] as String?,
  imageUrl: json['image_url'] as String?,
  vaNumber: json['va_number'] as String?,
  expiredAt: json['expired_at'] == null
      ? null
      : DateTime.parse(json['expired_at'] as String),
);

Map<String, dynamic> _$CreateTransactionDataModelToJson(
  _CreateTransactionDataModel instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'amount': instance.amount,
  'payment_type': instance.paymentType,
  'bank': instance.bank,
  'image_url': instance.imageUrl,
  'va_number': instance.vaNumber,
  'expired_at': instance.expiredAt?.toIso8601String(),
};
