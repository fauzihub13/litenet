import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';

class DownloadInvoiceUsecase {
  final TransactionRepository transactionRepository;

  const DownloadInvoiceUsecase(this.transactionRepository);

  Future<Either<Failure, String>> call({required String orderId}) async {
    return await transactionRepository.downloadInvoice(orderId: orderId);
  }
}
