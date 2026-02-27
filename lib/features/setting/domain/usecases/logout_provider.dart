import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class LogoutUsecase {
  final SettingRepository settingRepository;

  const LogoutUsecase(this.settingRepository);

  Future<Either<Failure, LogoutResponse>> call() async {
    return await settingRepository.logout();
  }
}
