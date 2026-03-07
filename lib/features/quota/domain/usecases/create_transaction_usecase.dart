import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/create_transaction.dart';
import 'package:litenet/features/quota/domain/repositories/transaction_repository.dart';

class CreateTransactionUsecase {
  final TransactionRepository transactionRepository;

  const CreateTransactionUsecase(this.transactionRepository);

  Future<Either<Failure, CreateTransactionResponse>> call({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  }) async {
    return await transactionRepository.createTransaction(
      deviceId: deviceId,
      dataPlanId: dataPlanId,
      paymentMethod: paymentMethod,
      promoCode: promoCode,
    );
  }
}
