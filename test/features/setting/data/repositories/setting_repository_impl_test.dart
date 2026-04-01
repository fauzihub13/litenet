import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:litenet/features/setting/data/repositories/setting_repository_impl.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingDatasource extends Mock implements SettingDatasource {}

void main() {
  late MockSettingDatasource mockDatasource;
  late SettingRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockSettingDatasource();
    repository = SettingRepositoryImpl(settingDatasource: mockDatasource);
  });

  group('getFAQ', () {
    test('should return FAQResponse on success', () async {
      final tResponse = FAQResponse(success: true, message: 'ok', data: []);
      when(() => mockDatasource.getFAQ()).thenAnswer((_) async => tResponse);
      final result = await repository.getFAQ();
      expect(result, Right(tResponse));
    });
    test('should return Failure when response.success is false', () async {
      final tResponse = FAQResponse(success: false, message: 'fail', data: []);
      when(() => mockDatasource.getFAQ()).thenAnswer((_) async => tResponse);
      final result = await repository.getFAQ();
      expect(result.isLeft(), true);
    });
    test('should return Failure on error', () async {
      final failure = Failure(message: 'Exception: error');
      when(() => mockDatasource.getFAQ()).thenThrow(Exception('error'));
      final result = await repository.getFAQ();
      expect(result.isLeft(), true);
    });
  });

  group('getPrivacyAndPolicy', () {
    test('should return PrivacyAndPolicyResponse on success', () async {
      final tResponse = PrivacyAndPolicyResponse(
        success: true,
        message: 'ok',
        data: [],
      );
      when(
        () => mockDatasource.getPrivacyAndPolicy(),
      ).thenAnswer((_) async => tResponse);
      final result = await repository.getPrivacyAndPolicy();
      expect(result, Right(tResponse));
    });
    test('should return Failure when response.success is false', () async {
      final tResponse = PrivacyAndPolicyResponse(
        success: false,
        message: 'fail',
        data: [],
      );
      when(
        () => mockDatasource.getPrivacyAndPolicy(),
      ).thenAnswer((_) async => tResponse);
      final result = await repository.getPrivacyAndPolicy();
      expect(result.isLeft(), true);
    });
    test('should return Failure on error', () async {
      final failure = Failure(message: 'Exception: error');
      when(
        () => mockDatasource.getPrivacyAndPolicy(),
      ).thenThrow(Exception('error'));
      final result = await repository.getPrivacyAndPolicy();
     expect(result.isLeft(), true);
    });
  });

  group('getProfile', () {
    test('should return ProfileResponse on success', () async {
      final tResponse = ProfileResponse(
        success: true,
        message: 'ok',
        data: User(
          id: "USR-1",
          name: "Dummy User",
          avatar: "https://dummyimage.com/100x100/000/fff.png",
          email: "dummy@example.com",
          phoneNumber: "081234567890",
          role: "guest",
          emailOtp: "000000",
          emailOtpExpiredAt: DateTime.now().add(const Duration(minutes: 5)),
          emailVerifiedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: DateTime(1970, 1, 1),
        ),
      );
      when(
        () => mockDatasource.getProfile(),
      ).thenAnswer((_) async => tResponse);
      final result = await repository.getProfile();
      expect(result, Right(tResponse));
    });
    test('should return Failure when response.success is false', () async {
      final tResponse = ProfileResponse(
        success: false,
        message: 'fail',
        data: User(
          id: "USR-${DateTime.now().millisecondsSinceEpoch}", // ID unik dummy
          name: "Dummy User", // nama kosong
          avatar: "https://dummyimage.com/100x100/000/fff.png", // avatar dummy
          email: "dummy@example.com", // email dummy
          phoneNumber: "081234567890", // nomor dummy
          role: "guest", // role dummy
          emailOtp: "000000", // OTP dummy
          emailOtpExpiredAt: DateTime.now().add(
            const Duration(minutes: 5),
          ), // expired 5 menit
          emailVerifiedAt: DateTime.now(), // dianggap sudah diverifikasi
          createdAt: DateTime.now(), // waktu dibuat sekarang
          updatedAt: DateTime.now(), // waktu update sekarang
          deletedAt: DateTime(1970, 1, 1), // default kosong (epoch)
        )
      );
      when(
        () => mockDatasource.getProfile(),
      ).thenAnswer((_) async => tResponse);
      final result = await repository.getProfile();
      expect(result.isLeft(), true);
    });
    test('should return Failure on error', () async {
      final failure = Failure(message: 'Exception: error');
      when(() => mockDatasource.getProfile()).thenThrow(Exception('error'));
      final result = await repository.getProfile();
      expect(result.isLeft(), true);
    });
  });

  group('changePassword', () {
    test('should return ChangePasswordResponse on success', () async {
      final tResponse = ChangePasswordResponse(success: true, message: 'ok');
      when(
        () => mockDatasource.changePassword(
          oldPassword: 'old',
          newPassword: 'new',
          confirmNewPassword: 'new',
        ),
      ).thenAnswer((_) async => tResponse);
      final result = await repository.changePassword(
        oldPassword: 'old',
        newPassword: 'new',
        confirmNewPassword: 'new',
      );
      expect(result, Right(tResponse));
    });
    test('should return Failure when response.success is false', () async {
      final tResponse = ChangePasswordResponse(success: false, message: 'fail');
      when(
        () => mockDatasource.changePassword(
          oldPassword: 'old',
          newPassword: 'new',
          confirmNewPassword: 'new',
        ),
      ).thenAnswer((_) async => tResponse);
      final result = await repository.changePassword(
        oldPassword: 'old',
        newPassword: 'new',
        confirmNewPassword: 'new',
      );
      expect(result.isLeft(), true);
    });
    test('should return Failure on error', () async {
      final failure = Failure(message: 'Exception: error');
      when(
        () => mockDatasource.changePassword(
          oldPassword: 'old',
          newPassword: 'new',
          confirmNewPassword: 'new',
        ),
      ).thenThrow(Exception('error'));
      final result = await repository.changePassword(
        oldPassword: 'old',
        newPassword: 'new',
        confirmNewPassword: 'new',
      );
      expect(result.isLeft(), true);
    });
  });
}
