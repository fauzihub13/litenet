import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/datasources/auth_datasource.dart';
import 'package:litenet/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDatasource extends Mock implements AuthDatasource {}

void main() {
  late MockAuthDatasource mockDatasource;
  late AuthRepositoryImpl repository;

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

  final tLoginResponse = LoginResponse(
    success: true,
    message: 'Login successful',
    data: LoginDataEntity(
      user: tUser,
      isVerified: true,
      token: 'valid_token',
    ),
  );

  final tRegisterResponse = RegisterResponse(
    success: true,
    message: 'Registration successful',
  );

  final tOTPResponse = OTPResponse(
    success: true,
    message: 'OTP verified successfully',
    data: OTPDataEntity(
      user: tUser,
      isVerified: true,
      token: 'valid_token',
    ),
  );

  final tSummaryResponse = SummaryResponse(
    success: true,
    message: 'Summary fetched successfully',
    data: SummaryDataEntity(
      totalDevice: 10,
      onlineDevice: 7,
      offlineDevice: 2,
      inactiveDevice: 1,
    ),
  );

  setUp(() {
    mockDatasource = MockAuthDatasource();
    repository = AuthRepositoryImpl(authDatasource: mockDatasource);
  });

  group('AuthRepositoryImpl', () {
    group('login', () {
      const tEmail = 'test@example.com';
      const tPassword = 'password123';

      test('should return LoginResponse when datasource returns success', () async {
        // arrange
        when(() => mockDatasource.login(email: tEmail, password: tPassword))
            .thenAnswer((_) async => tLoginResponse);

        // act
        final result = await repository.login(email: tEmail, password: tPassword);

        // assert
        expect(result, Right(tLoginResponse));
        verify(() => mockDatasource.login(email: tEmail, password: tPassword)).called(1);
      });

      test('should return Failure when datasource returns !success', () async {
        // arrange
        final tFailResponse = LoginResponse(
          success: false,
          message: 'Invalid credentials',
          data: LoginDataEntity(
            user: tUser,
            isVerified: true,
            token: 'valid_token',
          ),
        );
        when(() => mockDatasource.login(email: tEmail, password: tPassword))
            .thenAnswer((_) async => tFailResponse);

        // act
        final result = await repository.login(email: tEmail, password: tPassword);

        // assert
        result.fold(
          (failure) {
            expect(failure, isA<Failure>());
            expect(failure.message, 'Invalid credentials');
          },
          (_) => fail('Should not be success'),
        );
        verify(() => mockDatasource.login(email: tEmail, password: tPassword)).called(1);
      });

      test('should return Failure when datasource throws an exception', () async {
        // arrange
        when(() => mockDatasource.login(email: tEmail, password: tPassword))
            .thenThrow(Exception('Server error'));

        // act
        final result = await repository.login(email: tEmail, password: tPassword);

        // assert
        result.fold(
          (failure) {
            expect(failure, isA<Failure>());
            expect(failure.message, contains('Server error'));
          },
          (_) => fail('Should not be success'),
        );
        verify(() => mockDatasource.login(email: tEmail, password: tPassword)).called(1);
      });
    });

    group('register', () {
      const tName = 'Test User';
      const tEmail = 'test@example.com';
      const tPassword = 'password123';
      const tPasswordConfirmation = 'password123';
      const tPhoneNumber = '08123456789';

      test('should return RegisterResponse when datasource returns success', () async {
        // arrange
        when(() => mockDatasource.register(
              name: tName,
              email: tEmail,
              password: tPassword,
              passwordConfirmation: tPasswordConfirmation,
              phoneNumber: tPhoneNumber,
            )).thenAnswer((_) async => tRegisterResponse);

        // act
        final result = await repository.register(
          name: tName,
          email: tEmail,
          password: tPassword,
          passwordConfirmation: tPasswordConfirmation,
          phoneNumber: tPhoneNumber,
        );

        // assert
        expect(result, Right(tRegisterResponse));
        verify(() => mockDatasource.register(
              name: tName,
              email: tEmail,
              password: tPassword,
              passwordConfirmation: tPasswordConfirmation,
              phoneNumber: tPhoneNumber,
            )).called(1);
      });

      test('should return Failure when datasource returns !success', () async {
        // arrange
        final tFailResponse = RegisterResponse(
          success: false,
          message: 'Email already exists',
        );
        when(() => mockDatasource.register(
              name: tName,
              email: tEmail,
              password: tPassword,
              passwordConfirmation: tPasswordConfirmation,
              phoneNumber: tPhoneNumber,
            )).thenAnswer((_) async => tFailResponse);

        // act
        final result = await repository.register(
          name: tName,
          email: tEmail,
          password: tPassword,
          passwordConfirmation: tPasswordConfirmation,
          phoneNumber: tPhoneNumber,
        );

        // assert
        result.fold(
          (failure) {
            expect(failure, isA<Failure>());
            expect(failure.message, 'Email already exists');
          },
          (_) => fail('Should not be success'),
        );
      });
    });

    group('resendOTP', () {
      const tEmail = 'test@example.com';

      test('should return OTPResponse when datasource returns success', () async {
        // arrange
        when(() => mockDatasource.resendOTP(email: tEmail))
            .thenAnswer((_) async => tOTPResponse);

        // act
        final result = await repository.resendOTP(email: tEmail);

        // assert
        expect(result, Right(tOTPResponse));
        verify(() => mockDatasource.resendOTP(email: tEmail)).called(1);
      });
    });

    group('verifyOTP', () {
      const tEmail = 'test@example.com';
      const tOTP = '123456';

      test('should return OTPResponse when datasource returns success', () async {
        // arrange
        when(() => mockDatasource.verifyOTP(email: tEmail, otp: tOTP))
            .thenAnswer((_) async => tOTPResponse);

        // act
        final result = await repository.verifyOTP(email: tEmail, otp: tOTP);

        // assert
        expect(result, Right(tOTPResponse));
        verify(() => mockDatasource.verifyOTP(email: tEmail, otp: tOTP)).called(1);
      });
    });

    group('getSummary', () {
      test('should return SummaryResponse when datasource returns success', () async {
        // arrange
        when(() => mockDatasource.getSummary())
            .thenAnswer((_) async => tSummaryResponse);

        // act
        final result = await repository.getSummary();

        // assert
        expect(result, Right(tSummaryResponse));
        verify(() => mockDatasource.getSummary()).called(1);
      });
    });
  });
}
