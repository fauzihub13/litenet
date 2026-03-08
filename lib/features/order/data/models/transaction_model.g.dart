// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionResponseModel _$TransactionResponseModelFromJson(
  Map<String, dynamic> json,
) => _TransactionResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => TransactionDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TransactionResponseModelToJson(
  _TransactionResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_TransactionDataModel _$TransactionDataModelFromJson(
  Map<String, dynamic> json,
) => _TransactionDataModel(
  id: json['id'] as String?,
  orderId: json['order_id'] as String?,
  packageName: json['package_name'] as String?,
  capacity: json['capacity'] as String?,
  transactionStatus: json['transaction_status'] as String?,
  grossAmount: (json['gross_amount'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TransactionDataModelToJson(
  _TransactionDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'package_name': instance.packageName,
  'capacity': instance.capacity,
  'transaction_status': instance.transactionStatus,
  'gross_amount': instance.grossAmount,
  'created_at': instance.createdAt?.toIso8601String(),
};
