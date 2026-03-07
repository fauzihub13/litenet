import 'package:litenet/features/order/domain/usecases/check_payment_status_usecase.dart';
import 'package:litenet/features/order/domain/usecases/create_transaction_usecase.dart';
import 'package:litenet/features/order/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:litenet/features/quota/data/di/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
GetAllPaymentMethodUsecase getAllPaymentMethodUsecase(Ref ref) {
  return GetAllPaymentMethodUsecase(ref.read(transactionRepositoryProvider));
}

@Riverpod(keepAlive: true)
CreateTransactionUsecase createTransactionUsecase(Ref ref) {
  return CreateTransactionUsecase(ref.read(transactionRepositoryProvider));
}

@Riverpod(keepAlive: true)
CheckPaymentStatusUsecase checkPaymentStatusUsecase(Ref ref) {
  return CheckPaymentStatusUsecase(ref.read(transactionRepositoryProvider));
}
