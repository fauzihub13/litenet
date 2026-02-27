import 'package:litenet/features/setting/data/di/repository_provider.dart';
import 'package:litenet/features/setting/domain/usecases/logout_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
LogoutUsecase logoutUsecase(Ref ref) {
  return LogoutUsecase(ref.read(settingRepositoryProvider));
}
