import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/datasources/transaction_datasource.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionDatasource transactionDatasource;

  TransactionRepositoryImpl({required this.transactionDatasource});

  @override
  Future<Either<Failure, PaymentMethodResponse>> getAllPaymentMethod() async {
    try {
      final response = await transactionDatasource.getAllPaymentMethod();

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateTransactionResponse>> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  }) async {
    try {
      final response = await transactionDatasource.createTransaction(
        deviceId: deviceId,
        dataPlanId: dataPlanId,
        paymentMethod: paymentMethod,
        promoCode: promoCode,
      );

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CheckPaymentStatusResponse>> checkPaymentStatus({required String orderId}) async{
   try {
      final response = await transactionDatasource.checkPaymentStatus(
        orderId: orderId,
      );

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
