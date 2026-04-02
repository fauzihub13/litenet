import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:litenet/features/setting/data/repositories/setting_repository_impl.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingDatasource extends Mock implements SettingDatasource {}

void main() {
  late MockSettingDatasource mockDatasource;
  late SettingRepositoryImpl repository;

  final tUser = User(
    id: 'USR-001',
    name: 'Test User',
    avatar: 'https://example.com/avatar.png',
    email: 'test@example.com',
    phoneNumber: '08123456789',
    role: 'user',
    emailOtp: '123456',
    emailOtpExpiredAt: DateTime(2026, 1, 1),
    emailVerifiedAt: DateTime(2026, 1, 1),
    createdAt: DateTime(2026, 1, 1),
    updatedAt: DateTime(2026, 1, 1),
    deletedAt: DateTime(1970, 1, 1),
  );

  final tProfileResponse = ProfileResponse(
    success: true,
    message: 'Success',
    data: tUser,
  );

  final tLogoutResponse = LogoutResponse(success: true, message: 'Success');

  final tChangePasswordResponse = ChangePasswordResponse(
    success: true,
    message: 'Success',
  );

  final tFAQResponse = FAQResponse(success: true, message: 'Success', data: []);

  final tPrivacyResponse = PrivacyAndPolicyResponse(
    success: true,
    message: 'Success',
    data: [],
  );

  setUp(() {
    mockDatasource = MockSettingDatasource();
    repository = SettingRepositoryImpl(settingDatasource: mockDatasource);
  });

  group('SettingRepositoryImpl', () {
    group('getProfile', () {
      test(
        'should return ProfileResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getProfile(),
          ).thenAnswer((_) async => tProfileResponse);

          // act
          final result = await repository.getProfile();

          // assert
          expect(result, Right(tProfileResponse));
        },
      );
    });

    group('changeProfile', () {
      test(
        'should return ProfileResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.changeProfile(
              name: any(named: 'name'),
              email: any(named: 'email'),
              phoneNumber: any(named: 'phoneNumber'),
            ),
          ).thenAnswer((_) async => tProfileResponse);

          // act
          final result = await repository.changeProfile(
            name: 'Name',
            email: 'email@test.com',
            phoneNumber: '12345',
          );

          // assert
          expect(result, Right(tProfileResponse));
        },
      );
    });

    group('logout', () {
      test(
        'should return LogoutResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.logout(),
          ).thenAnswer((_) async => tLogoutResponse);

          // act
          final result = await repository.logout();

          // assert
          expect(result, Right(tLogoutResponse));
        },
      );
    });

    group('changePassword', () {
      test(
        'should return ChangePasswordResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.changePassword(
              oldPassword: any(named: 'oldPassword'),
              newPassword: any(named: 'newPassword'),
              confirmNewPassword: any(named: 'confirmNewPassword'),
            ),
          ).thenAnswer((_) async => tChangePasswordResponse);

          // act
          final result = await repository.changePassword(
            oldPassword: 'old',
            newPassword: 'new',
            confirmNewPassword: 'new',
          );

          // assert
          expect(result, Right(tChangePasswordResponse));
        },
      );
    });

    group('getFAQ', () {
      test(
        'should return FAQResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getFAQ(),
          ).thenAnswer((_) async => tFAQResponse);

          // act
          final result = await repository.getFAQ();

          // assert
          expect(result, Right(tFAQResponse));
        },
      );
    });

    group('getPrivacyAndPolicy', () {
      test(
        'should return PrivacyAndPolicyResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getPrivacyAndPolicy(),
          ).thenAnswer((_) async => tPrivacyResponse);

          // act
          final result = await repository.getPrivacyAndPolicy();

          // assert
          expect(result, Right(tPrivacyResponse));
        },
      );
    });
  });
}
