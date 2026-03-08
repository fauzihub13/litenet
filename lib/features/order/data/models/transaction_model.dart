import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionResponseModel with _$TransactionResponseModel {
  const factory TransactionResponseModel({
    bool? success,
    String? message,
    List<TransactionDataModel>? data,
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseModelFromJson(json);
}

@freezed
abstract class TransactionDataModel with _$TransactionDataModel {
  const factory TransactionDataModel({
    String? id,
    String? orderId,
    String? packageName,
    String? capacity,
    String? transactionStatus,
    int? grossAmount,
    DateTime? createdAt,
  }) = _TransactionDataModel;

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataModelFromJson(json);
}
