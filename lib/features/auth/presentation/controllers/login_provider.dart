import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  Future<LoginResponse> build({required String email, required String password}) async {
    print('masuk login provider $email $password');
    final usecase = ref.watch(loginUsecaseProvider);
    final result = await usecase.call(email: email, password: password);
    return result.fold((failure) => throw failure, (data) => data);
  }
}
