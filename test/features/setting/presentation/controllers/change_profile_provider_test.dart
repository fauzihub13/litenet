import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/usecases/change_profile_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/change_profile_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockChangeProfileUsecase extends Mock implements ChangeProfileUsecase {}
class MockUserManager extends Mock implements UserManager {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockChangeProfileUsecase mockChangeProfileUsecase;
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

  final tProfileResponse = ProfileResponse(
    success: true,
    message: 'Profile updated',
    data: tUser,
  );

  final tFailure = Failure(message: 'Failed to update profile');

  setUp(() {
    mockChangeProfileUsecase = MockChangeProfileUsecase();
    mockUserManager = MockUserManager();

    container = ProviderContainer(
      overrides: [
        changeProfileUsecaseProvider.overrideWithValue(mockChangeProfileUsecase),
        userManagerProvider.overrideWith((ref) => mockUserManager),
      ],
    );

    registerFallbackValue(tUser);
    registerFallbackValue(const AsyncLoading<ProfileResponse?>());
  });

  tearDown(() {
    container.dispose();
  });

  group('ChangeProfileProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(changeProfileProvider.future);
      expect(state, null);
      expect(container.read(changeProfileProvider), const AsyncData<ProfileResponse?>(null));
    });

    test('should emit AsyncLoading and then AsyncData on successful profile change', () async {
      // arrange
      when(() => mockChangeProfileUsecase.call(
        name: any(named: 'name'),
        email: any(named: 'email'),
        phoneNumber: any(named: 'phoneNumber'),
      )).thenAnswer((_) async => Right(tProfileResponse));

      when(() => mockUserManager.saveUser(any())).thenAnswer((_) async {});

      // Wait for build to finish
      await container.read(changeProfileProvider.future);

      final listener = Listener<AsyncValue<ProfileResponse?>>();
      container.listen(
        changeProfileProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(changeProfileProvider.notifier);

      // act
      await notifier.changeProfile(
        name: tUser.name,
        email: tUser.email,
        phoneNumber: tUser.phoneNumber,
      );

      // assert
      verifyInOrder([
        // Initial state from fireImmediately
        () => listener(any(), const AsyncData<ProfileResponse?>(null)),
        // Loading state
        () => listener(any(), any(that: isA<AsyncLoading>())),
        // Success state
        () => listener(any(), AsyncData<ProfileResponse?>(tProfileResponse)),
      ]);

      // verify dependencies were called
      verify(() => mockChangeProfileUsecase.call(
        name: tUser.name,
        email: tUser.email,
        phoneNumber: tUser.phoneNumber,
      )).called(1);
      verify(() => mockUserManager.saveUser(tUser)).called(1);
    });

    test('should emit AsyncError on failed profile change', () async {
      // arrange
      when(() => mockChangeProfileUsecase.call(
        name: any(named: 'name'),
        email: any(named: 'email'),
        phoneNumber: any(named: 'phoneNumber'),
      )).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(changeProfileProvider.future);

      final listener = Listener<AsyncValue<ProfileResponse?>>();
      container.listen(
        changeProfileProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(changeProfileProvider.notifier);

      // act
      await notifier.changeProfile(
        name: tUser.name,
        email: tUser.email,
        phoneNumber: tUser.phoneNumber,
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ProfileResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(changeProfileProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
