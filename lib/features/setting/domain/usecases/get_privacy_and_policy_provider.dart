import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class GetPrivacyAndPolicyUsecase {
  final SettingRepository settingRepository;

  const GetPrivacyAndPolicyUsecase(this.settingRepository);

  Future<Either<Failure, PrivacyAndPolicyResponse>> call() async {
    return await settingRepository.getPrivacyAndPolicy();
  }
}
