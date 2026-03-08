import 'package:litenet/features/order/data/models/detail_transaction_model.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';

extension DetailTransactionResponseModelMapper
    on DetailTransactionResponseModel {
  DetailTransactionResponse toEntity() {
    return DetailTransactionResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? DetailTransactionDataModel()).toEntity(),
    );
  }
}

extension DetailTransactionDataModelMapper on DetailTransactionDataModel {
  DetailTransactionDataEntity toEntity() {
    return DetailTransactionDataEntity(
      id: id ?? '-',
      orderId: orderId ?? '-',
      packageName: packageName ?? '-',
      capacity: capacity ?? '-',
      transactionStatus: transactionStatus ?? '-',
      grossAmount: grossAmount ?? 0,
      bankCode: bankCode ?? '-',
      bankName: bankName ?? '-',
      bankImageUrl: bankImageUrl ?? '-',
      vaNumber: vaNumber ?? '-',
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      expiredAt: expiredAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
