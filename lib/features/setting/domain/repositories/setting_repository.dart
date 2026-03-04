import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';

abstract class SettingRepository {
  Future<Either<Failure, LogoutResponse>> logout();
  Future<Either<Failure, ProfileResponse>> getProfile();
  Future<Either<Failure, ProfileResponse>> changeProfile({
    required String name,
    required String email,
    required String phoneNumber,
  });
  Future<Either<Failure, ChangePasswordResponse>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
  Future<Either<Failure, FAQResponse>> getFAQ();
  Future<Either<Failure, PrivacyAndPolicyResponse>> getPrivacyAndPolicy();
}


