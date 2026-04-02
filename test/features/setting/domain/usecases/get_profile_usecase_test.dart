import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/get_profile_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late GetProfileUsecase usecase;

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

  final tResponse = ProfileResponse(
    success: true,
    message: 'Profile fetched successfully',
    data: tUser,
  );

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = GetProfileUsecase(mockRepository);
  });

  group('GetProfileUsecase', () {
    test('should call getProfile from repository', () async {
      // arrange
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getProfile()).called(1);
    });

    test('should return Failure from repository when fetching profile fails', () async {
      // arrange
      final tFailure = Failure(message: 'Profile not found');
      when(() => mockRepository.getProfile())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
