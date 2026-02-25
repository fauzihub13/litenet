import 'package:litenet/core/provider/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_manager_provider.g.dart';

@riverpod
FutureOr<TokenManager> tokenManager(Ref ref) async {
  final sharedPreferences = await ref.watch(sharedPreferenceProvider.future);
  return TokenManager(sharedPreferences: sharedPreferences);
}

class TokenManager {
  final SharedPreferences sharedPreferences;

  TokenManager({required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  String? getToken() {
    return sharedPreferences.getString('token');
  }

  bool isLogin() {
    final token = getToken();
    return token != null;
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove('token');
  }
}
