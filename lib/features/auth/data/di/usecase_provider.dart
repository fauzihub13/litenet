import 'package:litenet/features/auth/data/di/repository_provider.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/register_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/resend_otp_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
LoginUsecase loginUsecase(Ref ref) {
  return LoginUsecase(ref.read(loginRepositoryProvider));
}

@Riverpod(keepAlive: true)
RegisterUsecase registerUsecase(Ref ref) {
  return RegisterUsecase(ref.read(registerRepositoryProvider));
}

@Riverpod(keepAlive: true)
VerifyOTPUsecase verifyOTPUsecase(Ref ref) {
  return VerifyOTPUsecase(ref.read(otpRepositoryProvider));
}

@Riverpod(keepAlive: true)
ResendOTPUsecase resendOTPUsecase(Ref ref) {
  return ResendOTPUsecase(ref.read(otpRepositoryProvider));
}
