import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class ChangePasswordUsecase {
  final SettingRepository settingRepository;

  const ChangePasswordUsecase(this.settingRepository);

  Future<Either<Failure, ChangePasswordResponse>> call({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    return await settingRepository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );
  }
}
