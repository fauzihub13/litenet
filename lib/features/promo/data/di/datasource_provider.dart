import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/promo/data/datasources/promo_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@Riverpod(keepAlive: true)
PromoDatasource promoDatasource(Ref ref) {
  return PromoDatasourceImpl(httpClient: ref.read(dioProvider));
}
