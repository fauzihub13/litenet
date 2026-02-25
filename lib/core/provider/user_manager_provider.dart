import 'dart:convert';

import 'package:litenet/core/provider/shared_preference_provider.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_manager_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<UserManager> userManager(Ref ref) async {
  final sharedPreferences = await ref.watch(sharedPreferenceProvider.future);
  return UserManager(sharedPreferences: sharedPreferences);
}

@riverpod
FutureOr<User> getCurrentUser(Ref ref) async {
  final userManager = await ref.watch(userManagerProvider.future);
  final user =  userManager.getUser();
  if (user != null) {
    return user;
  } else {
    throw Exception('User not found');
  }
}

class UserManager {
  final SharedPreferences sharedPreferences;

  UserManager({required this.sharedPreferences});

  Future<void> saveUser(User user) async {
    final userJson = user.toJson();
    final userString = jsonEncode(userJson);
    await sharedPreferences.setString('user', userString);
  }

  User? getUser() {
    final userString = sharedPreferences.getString('user');
    if (userString != null) {
      return User.fromJson(jsonDecode(userString));
    }
    return null;
  }

  Future<void> removeUser() async {
    await sharedPreferences.remove('user');
  }

  bool hasUser() {
    return sharedPreferences.containsKey('user');
  }
}
