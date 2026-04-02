import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';
import 'package:litenet/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late VerifyOTPUsecase usecase;

  final tUser = User(
    id: "USR-0001",
    name: "Test User",
    avatar: "https://example.com/avatar.png",
    email: "test@example.com",
    phoneNumber: "081234567890",
    role: "user",
    emailOtp: "123456",
    emailOtpExpiredAt: DateTime(2026, 1, 1),
    emailVerifiedAt: DateTime(2026, 1, 1),
    createdAt: DateTime(2026, 1, 1),
    updatedAt: DateTime(2026, 1, 1),
    deletedAt: DateTime(1970, 1, 1),
  );

  final tOTPResponse = OTPResponse(
    success: true,
    message: 'OTP verified successfully',
    data: OTPDataEntity(
      user: tUser,
      isVerified: true,
      token: "valid_token",
    ),
  );

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = VerifyOTPUsecase(mockRepository);
  });

  group('VerifyOTPUsecase', () {
    test('should call verifyOTP from repository with correct parameters', () async {
      // arrange
      when(
        () => mockRepository.verifyOTP(
          email: any(named: 'email'),
          otp: any(named: 'otp'),
        ),
      ).thenAnswer((_) async => Right(tOTPResponse));

      // act
      final result = await usecase(email: 'test@example.com', otp: '123456');

      // assert
      expect(result, Right(tOTPResponse));
      verify(
        () => mockRepository.verifyOTP(email: 'test@example.com', otp: '123456'),
      ).called(1);
    });

    test('should return Failure from repository when verification fails', () async {
      // arrange
      final tFailure = Failure(message: 'Invalid OTP');
      when(
        () => mockRepository.verifyOTP(
          email: any(named: 'email'),
          otp: any(named: 'otp'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(email: 'test@example.com', otp: '123456');

      // assert
      expect(result, Left(tFailure));
      verify(
        () => mockRepository.verifyOTP(email: 'test@example.com', otp: '123456'),
      ).called(1);
    });
  });
}
