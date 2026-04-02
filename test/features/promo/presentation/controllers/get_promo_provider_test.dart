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
      overrides: [
        getPromoUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetPromoProvider', () {
    test('should fetch promos and emit AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      final listener = Listener<AsyncValue<PromoResponse>>();
      container.listen(
        getPromoProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      final state = await container.read(getPromoProvider.future);

      // assert
      expect(state, tResponse);
      verify(() => mockUsecase.call()).called(1);
      
      verifyInOrder([
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<PromoResponse>(tResponse)),
      ]);
    });

    test('should emit AsyncError when fetching fails', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      final listener = Listener<AsyncValue<PromoResponse>>();
      container.listen(
        getPromoProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      try {
        await container.read(getPromoProvider.future);
      } catch (e) {
        expect(e, tFailure);
      }

      // assert
      final finalState = container.read(getPromoProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
