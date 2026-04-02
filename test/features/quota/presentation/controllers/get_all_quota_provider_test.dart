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
      overrides: [
        getAllQuotasUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetAllQuotaProvider', () {
    test('should fetch quotas and emit AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      final listener = Listener<AsyncValue<QuotaResponse>>();
      container.listen(
        getAllQuotaProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      final state = await container.read(getAllQuotaProvider.future);

      // assert
      expect(state, tResponse);
      verify(() => mockUsecase.call()).called(1);
      
      verifyInOrder([
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<QuotaResponse>(tResponse)),
      ]);
    });

    test('should emit AsyncError when fetching fails', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));
      

      final listener = Listener<AsyncValue<QuotaResponse>>();
      container.listen(
        getAllQuotaProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      try {
        await container.read(getAllQuotaProvider.future);
      } catch (e) {
        expect(e, tFailure);
      }

      // assert
      final finalState = container.read(getAllQuotaProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
