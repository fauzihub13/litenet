// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailTransactionResponseModel _$DetailTransactionResponseModelFromJson(
  Map<String, dynamic> json,
) => _DetailTransactionResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DetailTransactionDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DetailTransactionResponseModelToJson(
  _DetailTransactionResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_DetailTransactionDataModel _$DetailTransactionDataModelFromJson(
  Map<String, dynamic> json,
) => _DetailTransactionDataModel(
  id: json['id'] as String?,
  orderId: json['order_id'] as String?,
  packageName: json['package_name'] as String?,
  capacity: json['capacity'] as String?,
  transactionStatus: json['transaction_status'] as String?,
  grossAmount: (json['gross_amount'] as num?)?.toInt(),
  bankCode: json['bank_code'] as String?,
  bankName: json['bank_name'] as String?,
  bankImageUrl: json['bank_image_url'] as String?,
  vaNumber: json['va_number'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  expiredAt: json['expired_at'] == null
      ? null
      : DateTime.parse(json['expired_at'] as String),
);

Map<String, dynamic> _$DetailTransactionDataModelToJson(
  _DetailTransactionDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'package_name': instance.packageName,
  'capacity': instance.capacity,
  'transaction_status': instance.transactionStatus,
  'gross_amount': instance.grossAmount,
  'bank_code': instance.bankCode,
  'bank_name': instance.bankName,
  'bank_image_url': instance.bankImageUrl,
  'va_number': instance.vaNumber,
  'created_at': instance.createdAt?.toIso8601String(),
  'expired_at': instance.expiredAt?.toIso8601String(),
};
