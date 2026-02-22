import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository loginRepository;

  const LoginUsecase(this.loginRepository);

  Future<Either<Failure, LoginResponse>> call({
    required String email,
    required String password,
  }) async {
    return await loginRepository.login(email: email, password: password);
  }
}
