import 'package:litenet/features/auth/data/di/datasource_provider.dart';
import 'package:litenet/features/auth/data/repositories/login_repository_impl.dart';
import 'package:litenet/features/auth/domain/repositories/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
LoginRepository loginRepository(Ref ref) {
  // Use read() instead of watch() since datasource doesn't need to be reactive
  return LoginRepositoryImpl(
    loginDatasource: ref.read(loginDatasourceProvider),
  );
}
