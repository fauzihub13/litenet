import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/auth/data/datasources/login_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@Riverpod(keepAlive: true)
LoginDatasource loginDatasource(Ref ref) {
  // Use read() instead of watch() since Dio doesn't need to be reactive
  return LoginDatasourceImpl(httpClient: ref.read(dioProvider));
}
