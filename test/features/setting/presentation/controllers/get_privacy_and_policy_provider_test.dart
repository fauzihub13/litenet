import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/usecases/get_privacy_and_policy_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/get_privacy_and_policy_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPrivacyAndPolicyUsecase extends Mock
    implements GetPrivacyAndPolicyUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetPrivacyAndPolicyUsecase mockUsecase;
  late ProviderContainer container;

  final tPrivacyPolicy = PrivacyAndPolicyDataEntity(
    id: 'PP-001',
    slug: 'privacy-policy',
    title: 'Privacy Policy',
    description: 'Detailed privacy policy content...',
    createdAt: DateTime(2026, 4, 2, 10, 0, 0),
    updatedAt: DateTime(2026, 4, 2, 10, 0, 0),
    deletedAt: null,
  );

  final tResponse = PrivacyAndPolicyResponse(
    success: true,
    message: 'Privacy policy fetched successfully',
    data: [tPrivacyPolicy],
  );

  final tFailure = Failure(message: 'Failed to fetch privacy policy');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<PrivacyAndPolicyResponse>());
    registerFallbackValue(AsyncData<PrivacyAndPolicyResponse>(tResponse));
  });

  setUp(() {
    mockUsecase = MockGetPrivacyAndPolicyUsecase();
    container = ProviderContainer(
      overrides: [
        getPrivacyAndPolicyUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetPrivacyAndPolicyProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getPrivacyAndPolicyProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getPrivacyAndPolicyProvider.future);

      final listener = Listener<AsyncValue<PrivacyAndPolicyResponse?>>();
      container.listen(
        getPrivacyAndPolicyProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getPrivacyAndPolicyProvider.notifier);

      // act
      await notifier.fetchPrivacyAndPolicy();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<PrivacyAndPolicyResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<PrivacyAndPolicyResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getPrivacyAndPolicyProvider.future);

      final listener = Listener<AsyncValue<PrivacyAndPolicyResponse?>>();
      container.listen(
        getPrivacyAndPolicyProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getPrivacyAndPolicyProvider.notifier);

      // act
      await notifier.fetchPrivacyAndPolicy();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<PrivacyAndPolicyResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getPrivacyAndPolicyProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });

    // test('should fetch privacy policy and emit AsyncData on success', () async {
    //   // arrange
    //   when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

    //   final listener = Listener<AsyncValue<PrivacyAndPolicyResponse>>();
    //   container.listen(
    //     getPrivacyAndPolicyProvider,
    //     listener.call,
    //     fireImmediately: true,
    //   );

    //   // act
    //   final state = await container.read(getPrivacyAndPolicyProvider.future);

    //   // assert
    //   expect(state, tResponse);
    //   verify(() => mockUsecase.call()).called(1);

    //   verifyInOrder([
    //     () => listener(any(), any(that: isA<AsyncLoading>())),
    //     () => listener(any(), AsyncData<PrivacyAndPolicyResponse>(tResponse)),
    //   ]);
    // });

    // test('should emit AsyncError when fetching fails', () async {
    //   // arrange
    //   when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

    //   final listener = Listener<AsyncValue<PrivacyAndPolicyResponse>>();
    //   container.listen(
    //     getPrivacyAndPolicyProvider,
    //     listener.call,
    //     fireImmediately: true,
    //   );

    //   // act
    //   try {
    //     await container.read(getPrivacyAndPolicyProvider.future);
    //   } catch (e) {
    //     expect(e, tFailure);
    //   }

    //   // assert
    //   final finalState = container.read(getPrivacyAndPolicyProvider);
    //   expect(finalState, isA<AsyncError>());
    //   expect(finalState.error, tFailure);
    // });
  });
}
