import 'package:litenet/features/auth/data/di/datasource_provider.dart';
import 'package:litenet/features/auth/data/repositories/login_repository_impl.dart';
import 'package:litenet/features/auth/data/repositories/register_repository_impl.dart';
import 'package:litenet/features/auth/domain/repositories/login_repository.dart';
import 'package:litenet/features/auth/domain/repositories/register_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(
    loginDatasource: ref.read(loginDatasourceProvider),
  );
}

@Riverpod(keepAlive: true)
RegisterRepository registerRepository(Ref ref) {
  return RegisterRepositoryImpl(
    registerDatasource: ref.read(registerDatasourceProvider),
  );
}
