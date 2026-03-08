import 'package:litenet/features/promo/data/di/repository_provider.dart';
import 'package:litenet/features/promo/domain/usecases/get_promo_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
GetPromoUsecase getPromoUsecase(Ref ref) {
  return GetPromoUsecase(ref.read(promoRepositoryProvider));
}
