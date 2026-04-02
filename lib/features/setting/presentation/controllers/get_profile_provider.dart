import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_provider.g.dart';

@riverpod
class GetProfile extends _$GetProfile {
  @override
  FutureOr<ProfileResponse?> build() async {
    return null;
  }

  Future<void> fetchProfile() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getProfileUsecaseProvider);
    final result = await usecase.call();

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

