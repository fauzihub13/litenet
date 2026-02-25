// login_response_entity.dart
class LoginResponse {
  final bool success;
  final String message;
  final LoginDataEntity data;

  const LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

// login_data_entity.dart
class LoginDataEntity {
  final User user;
  final String token;

  const LoginDataEntity({required this.user, required this.token});
}

// user_entity.dart
class User {
  final String id;
  final String name;
  final String avatar;
  final String email;
  final String phoneNumber;
  final String role;
  final String emailOtp;
  final DateTime emailOtpExpiredAt;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  const User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.emailOtp,
    required this.emailOtpExpiredAt,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'emailOtp': emailOtp,
      'emailOtpExpiredAt': emailOtpExpiredAt.toIso8601String(),
      'emailVerifiedAt': emailVerifiedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
      emailOtp: json['emailOtp'],
      emailOtpExpiredAt: DateTime.parse(json['emailOtpExpiredAt']),
      emailVerifiedAt: DateTime.parse(json['emailVerifiedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: DateTime.parse(json['deletedAt']),
    );
  }
}
