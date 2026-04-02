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

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockResendOTPUsecase mockResendOTPUsecase;
  late MockVerifyOTPUsecase mockVerifyOTPUsecase;
  late ProviderContainer container;

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
    message: 'OTP processed successfully',
    data: OTPDataEntity(
      user: tUser,
      isVerified: true,
      token: "valid_token",
    ),
  );

  final tFailure = Failure(message: 'Invalid OTP');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<OTPResponse?>());
    registerFallbackValue(AsyncData<OTPResponse?>(tOTPResponse));
  });

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

  tearDown(() {
    container.dispose();
  });

  group('OTPProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(oTPProvider.future);
      expect(state, null);
    });

    group('resendOtp', () {
      test('should emit AsyncLoading and then AsyncData on success', () async {
        // arrange
        when(
          () => mockResendOTPUsecase.call(email: any(named: 'email')),
        ).thenAnswer((_) async => Right(tOTPResponse));

        // Wait for build to finish
        await container.read(oTPProvider.future);

        final listener = Listener<AsyncValue<OTPResponse?>>();
        container.listen(oTPProvider, listener.call, fireImmediately: true);

        final notifier = container.read(oTPProvider.notifier);

        // act
        await notifier.resendOtp(email: 'test@example.com');

        // assert
        verifyInOrder([
          () => listener(any(), const AsyncData<OTPResponse?>(null)),
          () => listener(any(), any(that: isA<AsyncLoading>())),
          () => listener(any(), AsyncData<OTPResponse?>(tOTPResponse)),
        ]);

        verify(() => mockResendOTPUsecase.call(email: 'test@example.com')).called(1);
      });

      test('should emit AsyncError on failure', () async {
        // arrange
        when(
          () => mockResendOTPUsecase.call(email: any(named: 'email')),
        ).thenAnswer((_) async => Left(tFailure));

        // Wait for build to finish
        await container.read(oTPProvider.future);

        final listener = Listener<AsyncValue<OTPResponse?>>();
        container.listen(oTPProvider, listener.call, fireImmediately: true);

        final notifier = container.read(oTPProvider.notifier);

        // act
        await notifier.resendOtp(email: 'test@example.com');

        // assert
        verifyInOrder([
          () => listener(any(), const AsyncData<OTPResponse?>(null)),
          () => listener(any(), any(that: isA<AsyncLoading>())),
          () => listener(any(), any(that: isA<AsyncError>())),
        ]);

        final finalState = container.read(oTPProvider);
        expect(finalState, isA<AsyncError>());
        expect(finalState.error, tFailure);
      });
    });

    group('verifyOtp', () {
      test('should emit AsyncLoading and then AsyncData on success', () async {
        // arrange
        when(
          () => mockVerifyOTPUsecase.call(
            email: any(named: 'email'),
            otp: any(named: 'otp'),
          ),
        ).thenAnswer((_) async => Right(tOTPResponse));

        // Wait for build to finish
        await container.read(oTPProvider.future);

        final listener = Listener<AsyncValue<OTPResponse?>>();
        container.listen(oTPProvider, listener.call, fireImmediately: true);

        final notifier = container.read(oTPProvider.notifier);

        // act
        await notifier.verifyOtp(email: 'test@example.com', otp: '123456');

        // assert
        verifyInOrder([
          () => listener(any(), const AsyncData<OTPResponse?>(null)),
          () => listener(any(), any(that: isA<AsyncLoading>())),
          () => listener(any(), AsyncData<OTPResponse?>(tOTPResponse)),
        ]);

        verify(
          () => mockVerifyOTPUsecase.call(email: 'test@example.com', otp: '123456'),
        ).called(1);
      });

      test('should emit AsyncError on failure', () async {
        // arrange
        when(
          () => mockVerifyOTPUsecase.call(
            email: any(named: 'email'),
            otp: any(named: 'otp'),
          ),
        ).thenAnswer((_) async => Left(tFailure));

        // Wait for build to finish
        await container.read(oTPProvider.future);

        final listener = Listener<AsyncValue<OTPResponse?>>();
        container.listen(oTPProvider, listener.call, fireImmediately: true);

        final notifier = container.read(oTPProvider.notifier);

        // act
        await notifier.verifyOtp(email: 'test@example.com', otp: '123456');

        // assert
        verifyInOrder([
          () => listener(any(), const AsyncData<OTPResponse?>(null)),
          () => listener(any(), any(that: isA<AsyncLoading>())),
          () => listener(any(), any(that: isA<AsyncError>())),
        ]);

        final finalState = container.read(oTPProvider);
        expect(finalState, isA<AsyncError>());
        expect(finalState.error, tFailure);
      });
    });
  });
}
