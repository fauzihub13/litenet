import 'dart:async';

import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/core/provider/user_manager_provider.dart';
import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';
@riverpod
class Login extends _$Login {
  @override
  FutureOr<LoginResponse?> build() async {
    return null;
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(loginUsecaseProvider);
    final result = await usecase.call(email: email, password: password);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) async {
        // simpan token
        final tokenManager = await ref.read(tokenManagerProvider.future);
        await tokenManager.saveToken(data.data.token);

        // simpan user
        final userManager = await ref.read(userManagerProvider.future);
        
        await userManager.saveUser(data.data.user);

        // update state sukses
        state = AsyncValue.data(data);
      },
    );
  }
}

