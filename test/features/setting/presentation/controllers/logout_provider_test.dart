import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/usecases/logout_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/logout_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockLogoutUsecase extends Mock implements LogoutUsecase {}
class MockTokenManager extends Mock implements TokenManager {}
class MockUserManager extends Mock implements UserManager {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockLogoutUsecase mockLogoutUsecase;
  late MockTokenManager mockTokenManager;
  late MockUserManager mockUserManager;
  late ProviderContainer container;

  final tLogoutResponse = LogoutResponse(
    success: true,
    message: 'Logout success',
  );

  final tFailure = Failure(message: 'Failed to logout');

  setUp(() {
    mockLogoutUsecase = MockLogoutUsecase();
    mockTokenManager = MockTokenManager();
    mockUserManager = MockUserManager();

    container = ProviderContainer(
      overrides: [
        logoutUsecaseProvider.overrideWithValue(mockLogoutUsecase),
        tokenManagerProvider.overrideWith((ref) => mockTokenManager),
        userManagerProvider.overrideWith((ref) => mockUserManager),
      ],
    );

    registerFallbackValue(const AsyncLoading<LogoutResponse?>());
  });

  tearDown(() {
    container.dispose();
  });

  group('LogoutProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(logoutProvider.future);
      expect(state, null);
      expect(container.read(logoutProvider), const AsyncData<LogoutResponse?>(null));
    });

    test('should emit AsyncLoading and then AsyncData on successful logout', () async {
      // arrange
      when(() => mockLogoutUsecase.call()).thenAnswer((_) async => Right(tLogoutResponse));

      when(() => mockTokenManager.removeToken()).thenAnswer((_) async {});
      when(() => mockUserManager.removeUser()).thenAnswer((_) async {});

      // Wait for build to finish
      await container.read(logoutProvider.future);

      final listener = Listener<AsyncValue<LogoutResponse?>>();
      container.listen(
        logoutProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(logoutProvider.notifier);

      // act
      await notifier.logout();

      // assert
      verifyInOrder([
        // Initial state from fireImmediately
        () => listener(any(), const AsyncData<LogoutResponse?>(null)),
        // Loading state
        () => listener(any(), any(that: isA<AsyncLoading>())),
        // Success state
        () => listener(any(), AsyncData<LogoutResponse?>(tLogoutResponse)),
      ]);

      // verify dependencies were called
      verify(() => mockLogoutUsecase.call()).called(1);
      verify(() => mockTokenManager.removeToken()).called(1);
      verify(() => mockUserManager.removeUser()).called(1);
    });

    test('should emit AsyncError on failed logout', () async {
      // arrange
      when(() => mockLogoutUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(logoutProvider.future);

      final listener = Listener<AsyncValue<LogoutResponse?>>();
      container.listen(
        logoutProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(logoutProvider.notifier);

      // act
      await notifier.logout();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<LogoutResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(logoutProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
