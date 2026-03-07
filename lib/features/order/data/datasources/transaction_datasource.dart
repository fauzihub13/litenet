import 'package:dio/dio.dart';
import 'package:litenet/features/order/data/mappers/create_transaction_mapper.dart';
import 'package:litenet/features/order/data/mappers/payment_method_mapper.dart';
import 'package:litenet/features/order/data/models/create_transaction_model.dart';
import 'package:litenet/features/order/data/models/payment_method_model.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';

abstract class TransactionDatasource {
  Future<PaymentMethodResponse> getAllPaymentMethod();

  Future<CreateTransactionResponse> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  });
}

class TransactionDatasourceImpl extends TransactionDatasource {
  final Dio httpClient;
  TransactionDatasourceImpl({required this.httpClient});

  @override
  Future<PaymentMethodResponse> getAllPaymentMethod() async {
    String url = '/payment-methods';
    final response = await httpClient.get(url);

    final data = PaymentMethodResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<CreateTransactionResponse> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  }) async {
    String url = '/transactions';
    final response = await httpClient.post(
      url,
      data: {
        "device_id": deviceId,
        "data_plan_id": dataPlanId,
        "payment_method": paymentMethod,
        "promo_code": promoCode,
      },
    );

    final data = CreateTransactionResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
