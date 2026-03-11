import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
class Logout extends _$Logout {
  @override
  FutureOr<LogoutResponse?> build() async {
    return null;
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(logoutUsecaseProvider);
    final result = await usecase.call();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) async {
        // hapus token
        final tokenManager = await ref.read(tokenManagerProvider.future);
        await tokenManager.removeToken();

        // hapus user
        final userManager = await ref.read(userManagerProvider.future);
        await userManager.removeUser();
        state = AsyncValue.data(data);
      },
    );
  }
}
