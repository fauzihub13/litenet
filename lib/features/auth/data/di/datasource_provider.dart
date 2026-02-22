import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/auth/data/datasources/login_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
LoginDatasource loginDatasource(Ref ref) {
  return LoginDatasourceImpl(httpClient: ref.watch(dioProvider));
}
