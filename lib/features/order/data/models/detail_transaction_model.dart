import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_transaction_model.freezed.dart';
part 'detail_transaction_model.g.dart';

@freezed
abstract class DetailTransactionResponseModel
    with _$DetailTransactionResponseModel {
  const factory DetailTransactionResponseModel({
    bool? success,
    String? message,
    DetailTransactionDataModel? data,
  }) = _DetailTransactionResponseModel;

  factory DetailTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailTransactionResponseModelFromJson(json);
}

@freezed
abstract class DetailTransactionDataModel with _$DetailTransactionDataModel {
  const factory DetailTransactionDataModel({
    String? id,
    String? orderId,
    String? packageName,
    String? capacity,
    String? transactionStatus,
    int? grossAmount,
    String? bankCode,
    String? bankName,
    String? bankImageUrl,
    String? vaNumber,
    DateTime? createdAt,
    DateTime? expiredAt,
  }) = _DetailTransactionDataModel;

  factory DetailTransactionDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailTransactionDataModelFromJson(json);
}
