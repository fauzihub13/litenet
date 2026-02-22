
import 'package:litenet/features/auth/domain/entities/login.dart';

import '../models/login_model.dart';

extension LoginResponseModelMapper on LoginResponseModel {
  LoginResponse toEntity() {
    return LoginResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? const LoginDataModel()).toEntity(),
    );
  }
}

extension LoginDataModelMapper on LoginDataModel {
  LoginDataEntity toEntity() {
    return LoginDataEntity(
      user: (user ?? const UserModel()).toEntity(),
      token: token ?? '-',
    );
  }
}

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(
      id: id ?? '-',
      name: name ?? '-',
      avatar: avatar ?? '-',
      email: email ?? '-',
      phoneNumber: phoneNumber ?? '-',
      role: role ?? '-',
      emailOtp: emailOtp ?? '-',
      emailOtpExpiredAt:
          emailOtpExpiredAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      emailVerifiedAt:
          emailVerifiedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
