import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/create_transaction.dart';
import 'package:litenet/features/quota/domain/entities/payment_method.dart';

abstract class TransactionRepository {
  Future<Either<Failure, PaymentMethodResponse>> getAllPaymentMethod();
  Future<Either<Failure, CreateTransactionResponse>> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode
  });
}
