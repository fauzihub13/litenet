import 'package:litenet/features/promo/data/di/usecase_provider.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_promo_provider.g.dart';

@riverpod
class GetPromo extends _$GetPromo {
  @override
  FutureOr<PromoResponse> build() async {
    final usecase = ref.read(getPromoUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
