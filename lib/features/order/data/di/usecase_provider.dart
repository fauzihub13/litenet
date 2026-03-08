import 'package:litenet/features/order/domain/usecases/check_payment_status_usecase.dart';
import 'package:litenet/features/order/domain/usecases/create_transaction_usecase.dart';
import 'package:litenet/features/order/domain/usecases/download_invoice_usecase.dart';
import 'package:litenet/features/order/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:litenet/features/order/domain/usecases/get_all_transaction_method_usecase.dart';
import 'package:litenet/features/order/domain/usecases/get_detail_transaction_method_usecase.dart';
import 'package:litenet/features/quota/data/di/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
GetAllPaymentMethodUsecase getAllPaymentMethodUsecase(Ref ref) {
  return GetAllPaymentMethodUsecase(ref.read(transactionRepositoryProvider));
}

@riverpod
CreateTransactionUsecase createTransactionUsecase(Ref ref) {
  return CreateTransactionUsecase(ref.read(transactionRepositoryProvider));
}

@riverpod
CheckPaymentStatusUsecase checkPaymentStatusUsecase(Ref ref) {
  return CheckPaymentStatusUsecase(ref.read(transactionRepositoryProvider));
}

@riverpod
GetAllTransactionUsecase getAllTransactionUsecase(Ref ref) {
  return GetAllTransactionUsecase(ref.read(transactionRepositoryProvider));
}

@riverpod
GetDetailTransactionUsecase getDetailTransactionUsecase(Ref ref) {
  return GetDetailTransactionUsecase(ref.read(transactionRepositoryProvider));
}

@riverpod
DownloadInvoiceUsecase downloadInvoiceUsecase(Ref ref) {
  return DownloadInvoiceUsecase(ref.read(transactionRepositoryProvider));
}