import 'package:litenet/features/promo/data/di/datasource_provider.dart';
import 'package:litenet/features/promo/data/repositories/promo_repository_impl.dart';
import 'package:litenet/features/promo/domain/repositories/promo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
PromoRepository promoRepository(Ref ref) {
  return PromoRepositoryImpl(
    promoDatasource: ref.read(promoDatasourceProvider),
  );
}
