import 'package:litenet/features/order/data/models/check_payment_status_model.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';

extension CheckPaymentStatusResponseModelMapper
    on CheckPaymentStatusResponseModel {
  CheckPaymentStatusResponse toEntity() {
    return CheckPaymentStatusResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? CheckPaymentStatusDataModel()).toEntity(),
    );
  }
}

extension CheckPaymentStatusDataModelMapper on CheckPaymentStatusDataModel {
  CheckPaymentStatusDataEntity toEntity() {
    return CheckPaymentStatusDataEntity(
      id: id ?? '-',
      userId: userId ?? '-',
      orderId: orderId ?? '-',
      transactionStatus: transactionStatus ?? '-',
      fraudStatus: fraudStatus ?? '-',
      bank: bank ?? '-',
      expiredAt: expiredAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
