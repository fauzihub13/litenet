import 'package:litenet/features/auth/data/di/repository_provider.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
LoginUsecase loginUsecase(Ref ref) {
  // Use read() instead of watch() since repository doesn't need to be reactive
  return LoginUsecase(ref.read(loginRepositoryProvider));
}
