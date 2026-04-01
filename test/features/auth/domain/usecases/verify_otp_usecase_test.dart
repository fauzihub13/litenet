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

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = VerifyOTPUsecase(mockRepository);
  });

  test('should return OTPResponse on success', () async {
    final tOtpResponse = OTPResponse(
      success: true,
      message: 'ok',
      data: OTPDataEntity(
        user: User(
          id: "USR-0000",
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
        isVerified: false, // default belum terverifikasi
        token: "DUMMYTOKEN", // token dummy
      ),
    );
    when(
      () => mockRepository.verifyOTP(email: 'test@email.com', otp: '123456'),
    ).thenAnswer((_) async => Right(tOtpResponse));
    final result = await usecase(email: 'test@email.com', otp: '123456');
    expect(result, Right(tOtpResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.verifyOTP(email: 'test@email.com', otp: '123456'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    final result = await usecase(email: 'test@email.com', otp: '123456');
    expect(result.isLeft(), true);
  });
}
