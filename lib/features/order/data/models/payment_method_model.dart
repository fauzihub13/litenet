import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_model.freezed.dart';
part 'payment_method_model.g.dart';

@freezed
abstract class PaymentMethodResponseModel with _$PaymentMethodResponseModel {
  const factory PaymentMethodResponseModel({
    bool? success,
    String? message,
    List<PaymentMethodDataModel>? data,
  }) = _PaymentMethodResponseModel;

  factory PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseModelFromJson(json);
}

@freezed
abstract class PaymentMethodDataModel with _$PaymentMethodDataModel {
  const factory PaymentMethodDataModel({
    String? id,
    String? code,
    String? name,
    String? type,
    String? provider,
    String? image,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? imageUrl,
  }) = _PaymentMethodDataModel;

  factory PaymentMethodDataModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDataModelFromJson(json);
}
