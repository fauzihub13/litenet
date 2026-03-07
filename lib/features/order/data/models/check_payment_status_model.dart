import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_payment_status_model.freezed.dart';
part 'check_payment_status_model.g.dart';

@freezed
abstract class CheckPaymentStatusResponseModel with _$CheckPaymentStatusResponseModel {
  const factory CheckPaymentStatusResponseModel({
    bool? success,
    String? message,
    CheckPaymentStatusDataModel? data,
  }) = _CheckPaymentStatusResponseModel;

  factory CheckPaymentStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckPaymentStatusResponseModelFromJson(json);
}

@freezed
abstract class CheckPaymentStatusDataModel with _$CheckPaymentStatusDataModel {
  const factory CheckPaymentStatusDataModel({
    String? id,
    String? userId,
    String? orderId,
    String? transactionStatus,
    String? fraudStatus,
    String? bank,
    DateTime? expiredAt,
  }) = _CheckPaymentStatusDataModel;

  factory CheckPaymentStatusDataModel.fromJson(Map<String, dynamic> json) =>
      _$CheckPaymentStatusDataModelFromJson(json);
}
