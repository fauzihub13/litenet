import 'package:litenet/features/auth/data/di/repository_provider.dart';
import 'package:litenet/features/auth/domain/usecases/get_summary_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/register_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/resend_otp_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
LoginUsecase loginUsecase(Ref ref) {
  return LoginUsecase(ref.read(authRepositoryProvider));
}

@riverpod
RegisterUsecase registerUsecase(Ref ref) {
  return RegisterUsecase(ref.read(authRepositoryProvider));
}

@riverpod
VerifyOTPUsecase verifyOTPUsecase(Ref ref) {
  return VerifyOTPUsecase(ref.read(authRepositoryProvider));
}

@riverpod
ResendOTPUsecase resendOTPUsecase(Ref ref) {
  return ResendOTPUsecase(ref.read(authRepositoryProvider));
}

@riverpod
GetSummaryUsecase getSummaryUsecase(Ref ref) {
  return GetSummaryUsecase(ref.read(authRepositoryProvider));
}
