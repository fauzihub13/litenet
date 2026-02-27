import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/repositories/otp_repository.dart';

class ResendOTPUsecase {
  final OTPRepository otpRepository;

  const ResendOTPUsecase(this.otpRepository);

  Future<Either<Failure, OTPResponse>> call({required String email}) async {
    return await otpRepository.resendOTP(email: email);
  }
}
