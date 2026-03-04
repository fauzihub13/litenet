import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class GetProfileUsecase {
  final SettingRepository settingRepository;

  const GetProfileUsecase(this.settingRepository);

  Future<Either<Failure, ProfileResponse>> call() async {
    return await settingRepository.getProfile();
  }
}
