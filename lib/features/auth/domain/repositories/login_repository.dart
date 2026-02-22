import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  });
}
