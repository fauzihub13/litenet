import 'package:litenet/features/auth/domain/entities/login.dart';

class ProfileResponse {
  final bool success;
  final String message;
  final User data;

  const ProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}