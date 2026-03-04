import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class ChangeProfileUsecase {
  final SettingRepository settingRepository;

  const ChangeProfileUsecase(this.settingRepository);

  Future<Either<Failure, ProfileResponse>> call({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    return await settingRepository.changeProfile(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
