import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';

class GetAllTransactionUsecase {
  final TransactionRepository transactionRepository;

  const GetAllTransactionUsecase(this.transactionRepository);

  Future<Either<Failure, TransactionResponse>> call() async {
    return await transactionRepository.getAllTransaction();
  }
}
