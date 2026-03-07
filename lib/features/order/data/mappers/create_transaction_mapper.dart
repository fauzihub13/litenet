import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/data/models/create_transaction_model.dart';

extension CreateTransactionResponseModelMapper
    on CreateTransactionResponseModel {
  CreateTransactionResponse toEntity() {
    return CreateTransactionResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? CreateTransactionDataModel()).toEntity(),
    );
  }
}

extension CreateTransactionDataModelMapper on CreateTransactionDataModel {
  CreateTransactionDataEntity toEntity() {
    return CreateTransactionDataEntity(
      orderId: orderId ?? '-',
      amount: amount ?? 0,
      paymentType: paymentType ?? '-',
      bank: bank ?? '-',
      imageUrl: imageUrl ?? '-',
      vaNumber: vaNumber ?? '-',
      expiredAt: expiredAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
