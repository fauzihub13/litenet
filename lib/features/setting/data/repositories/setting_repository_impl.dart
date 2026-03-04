import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class SettingRepositoryImpl extends SettingRepository {
  final SettingDatasource settingDatasource;

  SettingRepositoryImpl({required this.settingDatasource});

  @override
  Future<Either<Failure, LogoutResponse>> logout() async {
    try {
      final response = await settingDatasource.logout();

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    try {
      final response = await settingDatasource.getProfile();

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> changeProfile({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      final response = await settingDatasource.changeProfile(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
      );

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangePasswordResponse>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final response = await settingDatasource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FAQResponse>> getFAQ() async {
    try {
      final response = await settingDatasource.getFAQ();

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PrivacyAndPolicyResponse>>
  getPrivacyAndPolicy() async {
    try {
      final response = await settingDatasource.getPrivacyAndPolicy();

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
