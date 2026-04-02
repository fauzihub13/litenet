import 'package:litenet/features/promo/data/di/usecase_provider.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_promo_provider.g.dart';

@riverpod
class GetPromo extends _$GetPromo {
  @override
  FutureOr<PromoResponse?> build() async {
    return null;
  }

  Future<void> fetchPromo() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getPromoUsecaseProvider);
    final result = await usecase.call();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
