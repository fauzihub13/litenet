import 'package:litenet/features/order/data/models/payment_method_model.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';

extension PaymentMethodResponseModelMapper on PaymentMethodResponseModel {
  PaymentMethodResponse toEntity() {
    return PaymentMethodResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension PaymentMethodDataModelMapper on PaymentMethodDataModel {
  PaymentMethodDataEntity toEntity() {
    return PaymentMethodDataEntity(
      id: id ?? '-',
      code: code ?? '-',
      name: name ?? '-',
      type: type ?? '-',
      provider: provider ?? '-',
      image: image ?? '-',
      isActive: isActive ?? false,
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? '-',
      imageUrl: imageUrl ?? '-',
    );
  }
}
