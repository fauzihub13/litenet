import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';

class CheckPaymentStatusUsecase {
  final TransactionRepository transactionRepository;

  const CheckPaymentStatusUsecase(this.transactionRepository);

  Future<Either<Failure, CheckPaymentStatusResponse>> call({
    required String orderId,
  }) async {
    return await transactionRepository.checkPaymentStatus(orderId: orderId);
  }
}
