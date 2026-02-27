import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';

abstract class OTPRepository {
  Future<Either<Failure, OTPResponse>> verifyOTP({
    required String email,
    required String otp,
  });
  
  Future<Either<Failure, OTPResponse>> resendOTP({required String email});
}
