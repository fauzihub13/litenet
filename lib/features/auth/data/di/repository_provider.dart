import 'package:litenet/features/auth/data/di/datasource_provider.dart';
import 'package:litenet/features/auth/data/repositories/login_repository_impl.dart';
import 'package:litenet/features/auth/data/repositories/otp_repository_impl.dart';
import 'package:litenet/features/auth/data/repositories/register_repository_impl.dart';
import 'package:litenet/features/auth/domain/repositories/login_repository.dart';
import 'package:litenet/features/auth/domain/repositories/otp_repository.dart';
import 'package:litenet/features/auth/domain/repositories/register_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(
    loginDatasource: ref.read(loginDatasourceProvider),
  );
}

@riverpod
RegisterRepository registerRepository(Ref ref) {
  return RegisterRepositoryImpl(
    registerDatasource: ref.read(registerDatasourceProvider),
  );
}

@riverpod
OTPRepository otpRepository(Ref ref) {
  return OTPRepositoryImpl(
    otpDatasource: ref.read(otpDatasourceProvider),
  );
}
