import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase usecase;

  final tUser = User(
    id: '1',
    name: 'Test User',
    avatar: 'avatar.png',
    email: 'test@example.com',
    phoneNumber: '08123456789',
    role: 'user',
    emailOtp: '123456',
    emailOtpExpiredAt: DateTime(2026, 1, 1),
    emailVerifiedAt: DateTime(2026, 1, 1),
    createdAt: DateTime(2026, 1, 1),
    updatedAt: DateTime(2026, 1, 1),
    deletedAt: DateTime(2026, 1, 1),
  );

  final tLoginResponse = LoginResponse(
    success: true,
    message: 'Login success',
    data: LoginDataEntity(
      user: tUser,
      isVerified: true,
      token: 'valid_token',
    ),
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginUsecase(mockAuthRepository);
  });

  group('LoginUsecase', () {
    test('should call login from repository with correct parameters', () async {
      // arrange
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Right(tLoginResponse));

      // act
      final result = await usecase(email: 'test@example.com', password: 'password123');

      // assert
      expect(result, Right(tLoginResponse));
      verify(
        () => mockAuthRepository.login(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('should return Failure from repository when login fails', () async {
      // arrange
      final tFailure = Failure(message: 'Invalid credentials');
      when(
        () => mockAuthRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(email: 'test@example.com', password: 'password123');

      // assert
      expect(result, Left(tFailure));
      verify(
        () => mockAuthRepository.login(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });
  });
}
