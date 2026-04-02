import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';
import 'package:litenet/features/auth/domain/usecases/get_summary_usecase.dart';
import 'package:litenet/features/auth/presentation/controllers/get_summary_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSummaryUsecase extends Mock implements GetSummaryUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetSummaryUsecase mockGetSummaryUsecase;
  late ProviderContainer container;

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

  final tFailure = Failure(message: 'Failed to fetch summary');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<SummaryResponse>());
    registerFallbackValue(AsyncData<SummaryResponse>(tSummaryResponse));
  });

  setUp(() {
    mockGetSummaryUsecase = MockGetSummaryUsecase();
    container = ProviderContainer(
      overrides: [
        getSummaryUsecaseProvider.overrideWithValue(mockGetSummaryUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetSummaryProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getSummaryProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(
        () => mockGetSummaryUsecase.call(),
      ).thenAnswer((_) async => Right(tSummaryResponse));

      // Wait for build to finish
      await container.read(getSummaryProvider.future);

      final listener = Listener<AsyncValue<SummaryResponse?>>();
      container.listen(
        getSummaryProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getSummaryProvider.notifier);

      // act
      await notifier.fetchSummary();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<SummaryResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<SummaryResponse?>(tSummaryResponse)),
      ]);

      verify(() => mockGetSummaryUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockGetSummaryUsecase.call(),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getSummaryProvider.future);

      final listener = Listener<AsyncValue<SummaryResponse?>>();
      container.listen(
        getSummaryProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getSummaryProvider.notifier);

      // act
      await notifier.fetchSummary();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<SummaryResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getSummaryProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
