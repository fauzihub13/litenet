import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/data/di/usecase_provider.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/domain/usecases/get_promo_usecase.dart';
import 'package:litenet/features/promo/presentation/controllers/get_promo_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPromoUsecase extends Mock implements GetPromoUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetPromoUsecase mockUsecase;
  late ProviderContainer container;

  final tPromoData = PromoDataEntity(
    id: "PROMO-2026-APRIL",
    slug: "internet-hemat-april",
    title: "Promo Internet Hemat April",
    minimumTransaction: 50000,
    maxDiscount: 20000,
    promoCode: "HEMATAPRIL26",
    startAt: DateTime(2026, 4, 1),
    endAt: DateTime(2026, 4, 30),
    isActive: true,
    createdAt: DateTime(2026, 3, 25),
    updatedAt: DateTime(2026, 4, 1),
    deletedAt: null,
  );

  final tResponse = PromoResponse(
    success: true,
    message: 'Promos fetched successfully',
    data: [tPromoData],
  );

  final tFailure = Failure(message: 'Failed to fetch promos');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<PromoResponse>());
    registerFallbackValue(AsyncData<PromoResponse>(tResponse));
  });

  setUp(() {
    mockUsecase = MockGetPromoUsecase();
    container = ProviderContainer(
      overrides: [getPromoUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetPromoProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getPromoProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getPromoProvider.future);

      final listener = Listener<AsyncValue<PromoResponse?>>();
      container.listen(getPromoProvider, listener.call, fireImmediately: true);

      final notifier = container.read(getPromoProvider.notifier);

      // act
      await notifier.fetchPromo();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<PromoResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<PromoResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getPromoProvider.future);

      final listener = Listener<AsyncValue<PromoResponse?>>();
      container.listen(getPromoProvider, listener.call, fireImmediately: true);

      final notifier = container.read(getPromoProvider.notifier);

      // act
      await notifier.fetchPromo();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<PromoResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getPromoProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
