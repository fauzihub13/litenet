import 'package:litenet/features/quota/data/di/repository_provider.dart';
import 'package:litenet/features/quota/domain/usecases/check_promo_usecase.dart';
import 'package:litenet/features/order/domain/usecases/create_transaction_usecase.dart';
import 'package:litenet/features/order/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:litenet/features/quota/domain/usecases/get_all_quota_usecase.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
GetAllQuotaUsecase getAllQuotasUsecase(Ref ref) {
  return GetAllQuotaUsecase(ref.read(quotaRepositoryProvider));
}

@riverpod
GetDetailQuotaUsecase getDetailQuotaUsecase(Ref ref) {
  return GetDetailQuotaUsecase(ref.read(quotaRepositoryProvider));
}

@riverpod
CheckPromoUsecase checkPromoUsecase(Ref ref) {
  return CheckPromoUsecase(ref.read(quotaRepositoryProvider));
}

@riverpod
GetAllPaymentMethodUsecase getAllPaymentMethodUsecase(Ref ref) {
  return GetAllPaymentMethodUsecase(ref.read(transactionRepositoryProvider));
}

@riverpod
CreateTransactionUsecase createTransactionUsecase(Ref ref) {
  return CreateTransactionUsecase(ref.read(transactionRepositoryProvider));
}
