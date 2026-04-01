
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:litenet/features/auth/presentation/controllers/login_provider.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}
class MockTokenManager extends Mock implements TokenManager {}
class MockUserManager extends Mock implements UserManager {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockLoginUsecase mockLoginUsecase;
  late MockTokenManager mockTokenManager;
  late MockUserManager mockUserManager;
  late ProviderContainer container;

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

  final tFailure = Failure(message: 'Invalid credentials');

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    mockTokenManager = MockTokenManager();
    mockUserManager = MockUserManager();

    container = ProviderContainer(
      overrides: [
        loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
        tokenManagerProvider.overrideWith((ref) => mockTokenManager),
        userManagerProvider.overrideWith((ref) => mockUserManager),
      ],
    );

    registerFallbackValue(tUser);
    registerFallbackValue(const AsyncLoading<LoginResponse?>());
  });

  tearDown(() {
    container.dispose();
  });

  group('LoginProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(loginProvider.future);
      expect(state, null);
      expect(container.read(loginProvider), const AsyncData<LoginResponse?>(null));
    });

    test('should emit AsyncLoading and then AsyncData on successful login', () async {
      // arrange
      when(() => mockLoginUsecase.call(
        email: any(named: 'email'),
        password: any(named: 'password'),
      )).thenAnswer((_) async => Right(tLoginResponse));

      when(() => mockTokenManager.saveToken(any())).thenAnswer((_) async {});
      when(() => mockUserManager.saveUser(any())).thenAnswer((_) async {});

      // Wait for build to finish
      await container.read(loginProvider.future);

      final listener = Listener<AsyncValue<LoginResponse?>>();
      container.listen(
        loginProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(loginProvider.notifier);

      // act
      await notifier.login(email: 'test@example.com', password: 'password123');

      // assert
      verifyInOrder([
        // Initial state from fireImmediately
        () => listener(any(), const AsyncData<LoginResponse?>(null)),
        // Loading state
        () => listener(any(), any(that: isA<AsyncLoading>())),
        // Success state
        () => listener(any(), AsyncData<LoginResponse?>(tLoginResponse)),
      ]);

      // verify dependencies were called
      verify(() => mockLoginUsecase.call(
        email: 'test@example.com',
        password: 'password123',
      )).called(1);
      verify(() => mockTokenManager.saveToken('valid_token')).called(1);
      verify(() => mockUserManager.saveUser(tUser)).called(1);
    });

    test('should NOT save token/user if isVerified is false', () async {
      // arrange
      final unverifiedResponse = LoginResponse(
        success: true,
        message: 'OTP required',
        data: LoginDataEntity(
          user: tUser,
          isVerified: false,
          token: 'some_token',
        ),
      );

      when(() => mockLoginUsecase.call(
        email: any(named: 'email'),
        password: any(named: 'password'),
      )).thenAnswer((_) async => Right(unverifiedResponse));

      // Wait for build to finish
      await container.read(loginProvider.future);

      final notifier = container.read(loginProvider.notifier);

      // act
      await notifier.login(email: 'test@example.com', password: 'password123');

      // assert
      final finalState = container.read(loginProvider);
      expect(finalState.value, unverifiedResponse);

      // verify dependencies
      verifyNever(() => mockTokenManager.saveToken(any()));
      verifyNever(() => mockUserManager.saveUser(any()));
    });

    test('should emit AsyncError on failed login', () async {
      // arrange
      when(() => mockLoginUsecase.call(
        email: any(named: 'email'),
        password: any(named: 'password'),
      )).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(loginProvider.future);

      final listener = Listener<AsyncValue<LoginResponse?>>();
      container.listen(
        loginProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(loginProvider.notifier);

      // act
      await notifier.login(email: 'test@example.com', password: 'wrong_password');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<LoginResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(loginProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
