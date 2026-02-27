import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/repositories/otp_repository.dart';

class VerifyOTPUsecase {
  final OTPRepository otpRepository;

  const VerifyOTPUsecase(this.otpRepository);

  Future<Either<Failure, OTPResponse>> call({
    required String email,
    required String otp,
  }) async {
    return await otpRepository.verifyOTP(email: email, otp: otp);
  }
}
