import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_promo_provider.g.dart';

@riverpod
class CheckPromo extends _$CheckPromo {
  @override
  FutureOr<CheckPromoResponse?> build() async {
    return null;
  }

  Future<void> checkPromoCode({
    required String dataPlanId,
    required String promoCode,
  }) async {
    state = const AsyncValue.loading();
    
    final usecase = ref.read(checkPromoUsecaseProvider);
    final result = await usecase.call(
      dataPlanId: dataPlanId,
      promoCode: promoCode,
    );

   return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
