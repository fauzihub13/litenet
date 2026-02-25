import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponse>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  });
}
