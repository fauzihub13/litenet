import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';

class ResendOTPUsecase {
  final AuthRepository authRepository;

  const ResendOTPUsecase(this.authRepository);

  Future<Either<Failure, OTPResponse>> call({required String email}) async {
    return await authRepository.resendOTP(email: email);
  }
}
