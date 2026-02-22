import 'package:litenet/features/auth/data/di/repository_provider.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
LoginUsecase loginUsecase(Ref ref) {
    print('masuk login usecase');

  return LoginUsecase(ref.watch(loginRepositoryProvider));
}
