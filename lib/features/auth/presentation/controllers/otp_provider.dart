import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_provider.g.dart';

@riverpod
class OTP extends _$OTP {
  @override
  FutureOr<OTPResponse?> build() async {
    return null;
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(verifyOTPUsecaseProvider);
    final result = await usecase.call(email: email, otp: otp);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
  
  Future<void> resendOtp({required String email}) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(resendOTPUsecaseProvider);
    final result = await usecase.call(email: email);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
