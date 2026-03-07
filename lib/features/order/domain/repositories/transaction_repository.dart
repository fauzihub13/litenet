import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';

abstract class TransactionRepository {
  Future<Either<Failure, PaymentMethodResponse>> getAllPaymentMethod();
  Future<Either<Failure, CreateTransactionResponse>> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  });
  Future<Either<Failure, CheckPaymentStatusResponse>> checkPaymentStatus({
    required String orderId,
  });
}
