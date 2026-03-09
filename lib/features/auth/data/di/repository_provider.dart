import 'package:litenet/features/auth/data/di/datasource_provider.dart';
import 'package:litenet/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(authDatasource: ref.read(authDatasourceProvider));
}
