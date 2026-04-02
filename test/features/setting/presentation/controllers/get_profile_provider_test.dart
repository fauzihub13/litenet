import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/usecases/get_profile_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/get_profile_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProfileUsecase extends Mock implements GetProfileUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetProfileUsecase mockUsecase;
  late ProviderContainer container;

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

  final tFailure = Failure(message: 'Failed to fetch profile');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<ProfileResponse>());
    registerFallbackValue(AsyncData<ProfileResponse>(tResponse));
  });

  setUp(() {
    mockUsecase = MockGetProfileUsecase();
    container = ProviderContainer(
      overrides: [getProfileUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetProfileProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getProfileProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getProfileProvider.future);

      final listener = Listener<AsyncValue<ProfileResponse?>>();
      container.listen(
        getProfileProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getProfileProvider.notifier);

      // act
      await notifier.fetchProfile();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ProfileResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<ProfileResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getProfileProvider.future);

      final listener = Listener<AsyncValue<ProfileResponse?>>();
      container.listen(
        getProfileProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getProfileProvider.notifier);

      // act
      await notifier.fetchProfile();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ProfileResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getProfileProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
