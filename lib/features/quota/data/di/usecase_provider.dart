import 'package:litenet/features/quota/data/di/repository_provider.dart';
import 'package:litenet/features/quota/domain/usecases/check_promo_usecase.dart';
import 'package:litenet/features/quota/domain/usecases/get_all_quota_usecase.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
GetAllQuotaUsecase getAllQuotasUsecase(Ref ref) {
  return GetAllQuotaUsecase(ref.read(quotaRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetDetailQuotaUsecase getDetailQuotaUsecase(Ref ref) {
  return GetDetailQuotaUsecase(ref.read(quotaRepositoryProvider));
}

@Riverpod(keepAlive: true)
CheckPromoUsecase checkPromoUsecase(Ref ref) {
  return CheckPromoUsecase(ref.read(quotaRepositoryProvider));
}
