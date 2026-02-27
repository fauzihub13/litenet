import 'package:litenet/features/auth/domain/entities/login.dart';

class OTPResponse {
  final bool success;
  final String message;
  final OTPDataEntity data;

  const OTPResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

// login_data_entity.dart
class OTPDataEntity {
  final User user;
  final bool isVerified;
  final String token;

  const OTPDataEntity({
    required this.user,
    required this.isVerified,
    required this.token,
  });
}
