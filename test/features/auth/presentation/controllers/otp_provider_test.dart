import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/usecases/resend_otp_usecase.dart';
import 'package:litenet/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:litenet/features/auth/presentation/controllers/otp_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockResendOTPUsecase extends Mock implements ResendOTPUsecase {}

class MockVerifyOTPUsecase extends Mock implements VerifyOTPUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockResendOTPUsecase mockResendOTPUsecase;
  late MockVerifyOTPUsecase mockVerifyOTPUsecase;
  late ProviderContainer container;

  setUp(() {
    mockResendOTPUsecase = MockResendOTPUsecase();
    mockVerifyOTPUsecase = MockVerifyOTPUsecase();
    container = ProviderContainer(
      overrides: [
        resendOTPUsecaseProvider.overrideWithValue(mockResendOTPUsecase),
        verifyOTPUsecaseProvider.overrideWithValue(mockVerifyOTPUsecase),
      ],
    );
  });

  group('Resend OTP', () {
    test('should emit loading and then data on success', () async {
      final tResendOTPResponse = OTPResponse(
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
        () => mockResendOTPUsecase(email: 'a'),
      ).thenAnswer((_) async => Right(tResendOTPResponse));

      final notifier = container.read(oTPProvider.notifier);
      final future = notifier.resendOtp(email: 'a');
      expect(container.read(oTPProvider), isA<AsyncLoading>());
      await future;
      OTPResponse? value;
      for (var i = 0; i < 100; i++) {
        final state = container.read(oTPProvider);
        if (!state.isLoading) {
          value = state.value;
          break;
        }
        await Future.delayed(const Duration(milliseconds: 10));
      }
      expect(value, isNotNull);
      expect(value, tResendOTPResponse);
    });

    test('should emit loading and then error on failure', () async {
      when(
        () => mockResendOTPUsecase(email: 'a'),
      ).thenAnswer((_) async => Left(Failure(message: 'error')));

      final notifier = container.read(oTPProvider.notifier);
      final future = notifier.resendOtp(email: 'a');
      expect(container.read(oTPProvider), isA<AsyncLoading>());
      await future;
      expect(container.read(oTPProvider).hasError, true);
    });
  });

  group('Verify OTP', () {
    test('should emit loading and then data on success', () async {
      final tResendOTPResponse = OTPResponse(
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
        () => mockVerifyOTPUsecase(email: 'a', otp: '000000'),
      ).thenAnswer((_) async => Right(tResendOTPResponse));

      final notifier = container.read(oTPProvider.notifier);
      final future = notifier.verifyOtp(email: 'a', otp: '000000');
      expect(container.read(oTPProvider), isA<AsyncLoading>());
      await future;
      OTPResponse? value;
      for (var i = 0; i < 100; i++) {
        final state = container.read(oTPProvider);
        if (!state.isLoading) {
          value = state.value;
          break;
        }
        await Future.delayed(const Duration(milliseconds: 10));
      }
      expect(value, isNotNull);
      expect(value, tResendOTPResponse);
    });

    test('should emit loading and then error on failure', () async {
      when(
        () => mockVerifyOTPUsecase(email: 'a', otp: '000000'),
      ).thenAnswer((_) async => Left(Failure(message: 'error')));

      final notifier = container.read(oTPProvider.notifier);
      final future = notifier.verifyOtp(email: 'a', otp: '000000');
      expect(container.read(oTPProvider), isA<AsyncLoading>());
      await future;
      expect(container.read(oTPProvider).hasError, true);
    });
  });
}
