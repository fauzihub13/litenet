import 'package:litenet/features/order/data/models/transaction_model.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';

extension TransactionResponseModelMapper on TransactionResponseModel {
  TransactionResponse toEntity() {
    return TransactionResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension TransactionDataModelMapper on TransactionDataModel {
  TransactionDataEntity toEntity() {
    return TransactionDataEntity(
      id: id ?? '-',
      orderId: orderId ?? '-',
      packageName: packageName ?? '-',
      capacity: capacity ?? '-',
      transactionStatus: transactionStatus ?? '-',
      grossAmount: grossAmount ?? 0,
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
