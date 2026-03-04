import 'package:litenet/features/setting/data/di/repository_provider.dart';
import 'package:litenet/features/setting/domain/usecases/change_password_provider.dart';
import 'package:litenet/features/setting/domain/usecases/change_profile_provider.dart';
import 'package:litenet/features/setting/domain/usecases/get_faq_provider.dart';
import 'package:litenet/features/setting/domain/usecases/get_privacy_and_policy_provider.dart';
import 'package:litenet/features/setting/domain/usecases/get_profile_provider.dart';
import 'package:litenet/features/setting/domain/usecases/logout_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
LogoutUsecase logoutUsecase(Ref ref) {
  return LogoutUsecase(ref.read(settingRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetProfileUsecase getProfileUsecase(Ref ref) {
  return GetProfileUsecase(ref.read(settingRepositoryProvider));
}

@Riverpod(keepAlive: true)
ChangeProfileUsecase changeProfileUsecase(Ref ref) {
  return ChangeProfileUsecase(ref.read(settingRepositoryProvider));
}

@Riverpod(keepAlive: true)
ChangePasswordUsecase changePasswordUsecase(Ref ref) {
  return ChangePasswordUsecase(ref.read(settingRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetFAQUsecase getFAQUsecase(Ref ref) {
  return GetFAQUsecase(ref.read(settingRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetPrivacyAndPolicyUsecase getPrivacyAndPolicyUsecase(Ref ref) {
  return GetPrivacyAndPolicyUsecase(ref.read(settingRepositoryProvider));
}
