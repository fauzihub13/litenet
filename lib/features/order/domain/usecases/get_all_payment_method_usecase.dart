import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';

class GetAllPaymentMethodUsecase {
  final TransactionRepository transactionRepository;

  const GetAllPaymentMethodUsecase(this.transactionRepository);

  Future<Either<Failure, PaymentMethodResponse>> call() async {
    return await transactionRepository.getAllPaymentMethod();
  }
}
