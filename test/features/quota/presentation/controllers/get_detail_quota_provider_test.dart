import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/get_detail_quota_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

class MockGetDetailQuotaUsecase extends Mock implements GetDetailQuotaUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetDetailQuotaUsecase mockUsecase;
  late ProviderContainer container;

  final tDetailQuotaEntity = DetailQuotaDataEntity(
    id: "QUOTA-2026-APRIL",
    code: "QAPR26",
    slug: "paket-internet-hemat-april",
    name: "Paket Internet Hemat April",
    quota: 20,
    monthDuration: 1,
    description: "Paket internet hemat dengan kuota 20GB.",
    basePrice: 100000,
    promoPrice: 80000,
    discount: 20000,
    capacity: "20GB",
    isPromo: true,
    terms: [],
    devices: [],
  );

  final tDetailQuotaResponse = DetailQuotaResponse(
    success: true,
    message: 'Success',
    data: tDetailQuotaEntity,
  );

  final tFailure = Failure(message: 'Quota not found');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<DetailQuotaResponse>());
    registerFallbackValue(AsyncData<DetailQuotaResponse>(tDetailQuotaResponse));
  });

  setUp(() {
    mockUsecase = MockGetDetailQuotaUsecase();
    container = ProviderContainer(
      overrides: [getDetailQuotaUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  group('GetDetailQuota', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').future,
      );
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(
        () => mockUsecase.call(id: 'QUOTA-2026-APRIL'),
      ).thenAnswer((_) async => Right(tDetailQuotaResponse));

      // Wait for build to finish
      await container.read(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').future,
      );

      final listener = Listener<AsyncValue<DetailQuotaResponse?>>();
      container.listen(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').notifier,
      );

      // act
      await notifier.fetchDetailQuota('QUOTA-2026-APRIL');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<DetailQuotaResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(
          any(),
          AsyncData<DetailQuotaResponse?>(tDetailQuotaResponse),
        ),
      ]);

      verify(() => mockUsecase.call(id: 'QUOTA-2026-APRIL')).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockUsecase.call(id: 'QUOTA-2026-APRIL'),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').future,
      );

      final listener = Listener<AsyncValue<DetailQuotaResponse?>>();
      container.listen(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').notifier,
      );

      // act
      await notifier.fetchDetailQuota('QUOTA-2026-APRIL');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<DetailQuotaResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(
        getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'),
      );
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}



    // // ----------------------------------------------------------------
    // // KONDISI SUKSES
    // // ----------------------------------------------------------------
    // test('should return DetailQuotaResponse when usecase succeeds', () async {
    //   // Arrange
    //   when(
    //     () => mockUsecase.call(id: any(named: 'id')),
    //   ).thenAnswer((_) async => Right(tDetailQuotaResponse));

    //   final container = makeContainer();
    //   final listener = Listener<AsyncValue<DetailQuotaResponse>>();

    //   container.listen(
    //     getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'),
    //     listener.call,
    //     fireImmediately: true,
    //   );

    //   // Act
    //   // Provider melempar Right(data) → fold → return data langsung
    //   final result = await container.read(
    //     getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').future,
    //   );

    //   // Assert
    //   expect(result, equals(tDetailQuotaResponse));

    //   final state = container.read(getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'));
    //   expect(state, isA<AsyncData<DetailQuotaResponse>>());
    //   expect(state.value, equals(tDetailQuotaResponse));

    //   verify(() => mockUsecase.call(id: 'QUOTA-2026-APRIL')).called(1);
    //   verifyNoMoreInteractions(mockUsecase);
    // });

    // // ----------------------------------------------------------------
    // // KONDISI GAGAL
    // // ----------------------------------------------------------------
    // test('should emit AsyncError when usecase fails', () async {
    //   // Arrange
    //   when(
    //     () => mockUsecase.call(id: any(named: 'id')),
    //   ).thenAnswer((_) async => Left(tFailure));

    //   final container = makeContainer();
    //   final listener = Listener<AsyncValue<DetailQuotaResponse>>();

    //   container.listen(
    //     getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'),
    //     listener.call,
    //     fireImmediately: true,
    //   );

    //   print('--- Provider state setelah listen ---');

    //   // Act
    //   // Provider melempar Left(failure) → fold → throw failure
    //   // Maka .future akan reject dengan Failure — tangkap pakai catchError
    //   try {
    //     await container.read(getDetailQuotaProvider(id: 'QUOTA-2026-APRIL').future);
    //   } catch (_) {
    //     // Expected — Failure dilempar dari provider
    //   }
    //   print('--- Provider state setelah catchError ---');

    //   // Assert — state akhir harus AsyncError berisi Failure
    //   final finalState = container.read(getDetailQuotaProvider(id: 'QUOTA-2026-APRIL'));
    //   expect(finalState, isA<AsyncError<DetailQuotaResponse>>());
    //   expect(finalState.error, equals(tFailure));

    //   verify(() => mockUsecase.call(id: 'QUOTA-2026-APRIL')).called(1);
    //   verifyNoMoreInteractions(mockUsecase);
    // });