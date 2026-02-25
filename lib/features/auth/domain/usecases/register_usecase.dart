import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:litenet/features/auth/domain/repositories/register_repository.dart';

class RegisterUsecase {
  final RegisterRepository registerRepository;

  const RegisterUsecase(this.registerRepository);

  Future<Either<Failure, RegisterResponse>> call({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  }) async {
    return await registerRepository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      phoneNumber: phoneNumber,
    );
  }
}
