import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/auth/data/models/otp_model.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';

extension OTPResponseModelMapper on OTPResponseModel {
  OTPResponse toEntity() {
    return OTPResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? const OTPDataModel()).toEntity(),
    );
  }
}

extension OTPDataModelMapper on OTPDataModel {
  OTPDataEntity toEntity() {
    return OTPDataEntity(
      user: (user ?? const UserModel()).toEntity(),
      isVerified: isVerified ?? false,
      token: token ?? '-',
    );
  }
}

extension OTPModelMapper on UserModel {
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
