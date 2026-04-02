import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/domain/usecases/get_all_quota_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/get_all_quota_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllQuotaUsecase extends Mock implements GetAllQuotaUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetAllQuotaUsecase mockUsecase;
  late ProviderContainer container;

  final tQuotaData = QuotaDataEntity(
    id: "QUOTA-2026-APRIL",
    code: "QAPR26",
    slug: "paket-internet-hemat-april",
    name: "Paket Internet Hemat April",
    quota: 20,
    monthDuration: 1,
    description:
        "Paket internet hemat dengan kuota 20GB berlaku selama 1 bulan.",
    basePrice: 100000,
    promoPrice: 80000,
    discount: 20000,
    capacity: "20GB",
    isPromo: true,
    createdAt: DateTime(2026, 3, 25),
    updatedAt: DateTime(2026, 4, 1),
    deletedAt: null,
  );

  final tResponse = QuotaResponse(
    success: true,
    message: 'Quotas fetched successfully',
    data: [tQuotaData],
  );

  final tFailure = Failure(message: 'Failed to fetch quotas');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<QuotaResponse>());
    registerFallbackValue(AsyncData<QuotaResponse>(tResponse));
  });

  setUp(() {
    mockUsecase = MockGetAllQuotaUsecase();
    container = ProviderContainer(
      overrides: [getAllQuotasUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetAllQuotaProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getAllQuotaProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getAllQuotaProvider.future);

      final listener = Listener<AsyncValue<QuotaResponse?>>();
      container.listen(
        getAllQuotaProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllQuotaProvider.notifier);

      // act
      await notifier.fetchAllQuota();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<QuotaResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<QuotaResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getAllQuotaProvider.future);

      final listener = Listener<AsyncValue<QuotaResponse?>>();
      container.listen(
        getAllQuotaProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllQuotaProvider.notifier);

      // act
      await notifier.fetchAllQuota();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<QuotaResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getAllQuotaProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
