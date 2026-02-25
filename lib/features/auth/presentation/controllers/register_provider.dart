import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  @override
  FutureOr<RegisterResponse?> build() async {
    return null;
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  }) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(registerUsecaseProvider);
    final result = await usecase.call(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      phoneNumber: phoneNumber,
    );

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
