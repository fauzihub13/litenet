import 'package:dio/dio.dart';
import 'package:litenet/features/order/data/mappers/check_payment_status_mapper.dart';
import 'package:litenet/features/order/data/mappers/create_transaction_mapper.dart';
import 'package:litenet/features/order/data/mappers/detail_transaction_mapper.dart';
import 'package:litenet/features/order/data/mappers/payment_method_mapper.dart';
import 'package:litenet/features/order/data/mappers/transaction_mapper.dart';
import 'package:litenet/features/order/data/models/check_payment_status_model.dart';
import 'package:litenet/features/order/data/models/create_transaction_model.dart';
import 'package:litenet/features/order/data/models/detail_transaction_model.dart';
import 'package:litenet/features/order/data/models/payment_method_model.dart';
import 'package:litenet/features/order/data/models/transaction_model.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';

abstract class TransactionDatasource {
  Future<PaymentMethodResponse> getAllPaymentMethod();
  Future<CreateTransactionResponse> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  });
  Future<CheckPaymentStatusResponse> checkPaymentStatus({
    required String orderId,
  });
  Future<TransactionResponse> getAllTransaction();
  Future<DetailTransactionResponse> getDetailTransaction({
    required String orderId,
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

  @override
  Future<CheckPaymentStatusResponse> checkPaymentStatus({
    required String orderId,
  }) async {
    String url = '/transactions/check-payment-status/$orderId';
    final response = await httpClient.get(url);

    final data = CheckPaymentStatusResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<TransactionResponse> getAllTransaction() async {
    String url = '/transactions';
    final response = await httpClient.get(url);

    final data = TransactionResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<DetailTransactionResponse> getDetailTransaction({
    required String orderId,
  }) async {
    String url = '/transactions/$orderId';
    final response = await httpClient.get(url);

    final data = DetailTransactionResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
