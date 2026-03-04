import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_privacy_and_policy_provider.g.dart';

@riverpod
class GetPrivacyAndPolicy extends _$GetPrivacyAndPolicy {
  @override
  FutureOr<PrivacyAndPolicyResponse> build() async {
    final usecase = ref.read(getPrivacyAndPolicyUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
