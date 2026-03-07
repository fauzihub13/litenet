import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transaction_model.freezed.dart';
part 'create_transaction_model.g.dart';

@freezed
abstract class CreateTransactionResponseModel with _$CreateTransactionResponseModel {
  const factory CreateTransactionResponseModel({
    bool? success,
    String? message,
    CreateTransactionDataModel? data,
  }) = _CreateTransactionResponseModel;

  factory CreateTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionResponseModelFromJson(json);
}

@freezed
abstract class CreateTransactionDataModel with _$CreateTransactionDataModel {
  const factory CreateTransactionDataModel({
   String? orderId,
    int? amount,
    String? paymentType,
    String? bank,
    String? imageUrl,
    String? vaNumber,
    DateTime? expiredAt,
  }) = _CreateTransactionDataModel;

  factory CreateTransactionDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionDataModelFromJson(json);
}
