import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/change_profile_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late ChangeProfileUsecase usecase;

  final tUser = User(
    id: 'USR-001',
    name: 'Updated Name',
    avatar: 'https://example.com/avatar.png',
    email: 'updated@example.com',
    phoneNumber: '08123456789',
    role: 'user',
    emailOtp: '123456',
    emailOtpExpiredAt: DateTime(2026, 1, 1),
    emailVerifiedAt: DateTime(2026, 1, 1),
    createdAt: DateTime(2026, 1, 1),
    updatedAt: DateTime(2026, 4, 2, 10, 0, 0),
    deletedAt: DateTime(1970, 1, 1),
  );

  final tResponse = ProfileResponse(
    success: true,
    message: 'Profile updated successfully',
    data: tUser,
  );

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = ChangeProfileUsecase(mockRepository);
  });

  group('ChangeProfileUsecase', () {
    test('should call changeProfile from repository with correct parameters', () async {
      // arrange
      when(() => mockRepository.changeProfile(
            name: any(named: 'name'),
            email: any(named: 'email'),
            phoneNumber: any(named: 'phoneNumber'),
          )).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(
        name: 'Updated Name',
        email: 'updated@example.com',
        phoneNumber: '08123456789',
      );

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.changeProfile(
            name: 'Updated Name',
            email: 'updated@example.com',
            phoneNumber: '08123456789',
          )).called(1);
    });

    test('should return Failure from repository when update fails', () async {
      // arrange
      final tFailure = Failure(message: 'Update failed');
      when(() => mockRepository.changeProfile(
            name: any(named: 'name'),
            email: any(named: 'email'),
            phoneNumber: any(named: 'phoneNumber'),
          )).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(
        name: 'Updated Name',
        email: 'updated@example.com',
        phoneNumber: '08123456789',
      );

      // assert
      expect(result, Left(tFailure));
    });
  });
}
