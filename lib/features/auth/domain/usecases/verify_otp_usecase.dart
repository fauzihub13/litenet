import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';

class VerifyOTPUsecase {
  final AuthRepository authRepository;

  const VerifyOTPUsecase(this.authRepository);

  Future<Either<Failure, OTPResponse>> call({
    required String email,
    required String otp,
  }) async {
    return await authRepository.verifyOTP(email: email, otp: otp);
  }
}
