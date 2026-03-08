import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';

class GetDetailTransactionUsecase {
  final TransactionRepository transactionRepository;

  const GetDetailTransactionUsecase(this.transactionRepository);

  Future<Either<Failure, DetailTransactionResponse>> call({
    required String orderId,
  }) async {
    return await transactionRepository.getDetailTransaction(orderId: orderId);
  }
}
