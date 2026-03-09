import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, OTPResponse>> verifyOTP({
    required String email,
    required String otp,
  });
  Future<Either<Failure, OTPResponse>> resendOTP({required String email});
  Future<Either<Failure, RegisterResponse>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  });
  Future<Either<Failure, SummaryResponse>> getSummary();

}
