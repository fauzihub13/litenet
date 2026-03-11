import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_profile_provider.g.dart';

@riverpod
class ChangeProfile extends _$ChangeProfile {
  @override
  FutureOr<ProfileResponse?> build() async {
    return null;
  }

  Future<void> changeProfile({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(changeProfileUsecaseProvider);
    final result = await usecase.call(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) async {
        // simpan user
        final userManager = await ref.read(userManagerProvider.future);
        await userManager.saveUser(data.data);
        state = AsyncValue.data(data);
      },
    );
  }
}
