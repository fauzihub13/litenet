import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/auth/data/datasources/auth_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
AuthDatasource authDatasource(Ref ref) {
  return AuthDatasourceImpl(httpClient: ref.read(dioProvider));
}
