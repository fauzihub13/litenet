import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/usecases/check_promo_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/check_promo_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCheckPromoUsecase extends Mock implements CheckPromoUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockCheckPromoUsecase mockUsecase;
  late ProviderContainer container;

  final tPromoData = PromoDataEntity(
    id: "PROMO-APRIL-2026",
    slug: "internet-super-hemat-april",
    title: "Promo Internet Super Hemat April",
    minimumTransaction: 75000,
    maxDiscount: 25000,
    promoCode: "SUPERHEMAT26",
    startAt: DateTime(2026, 4, 1),
    endAt: DateTime(2026, 4, 30),
    isActive: true,
    createdAt: DateTime(2026, 3, 28),
    updatedAt: DateTime(2026, 4, 1),
    deletedAt: null,
  );

  final tResponse = CheckPromoResponse(
    success: true,
    message: 'Promo code is valid',
    data: tPromoData,
  );

  final tFailure = Failure(message: 'Invalid promo code');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<CheckPromoResponse?>());
    registerFallbackValue(AsyncData<CheckPromoResponse?>(tResponse));
  });

  setUp(() {
    mockUsecase = MockCheckPromoUsecase();
    container = ProviderContainer(
      overrides: [checkPromoUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CheckPromoProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(checkPromoProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(
        () => mockUsecase.call(
          promoCode: any(named: 'promoCode'),
          dataPlanId: any(named: 'dataPlanId'),
        ),
      ).thenAnswer((_) async => Right(tResponse));

      // Wait for build
      await container.read(checkPromoProvider.future);

      final listener = Listener<AsyncValue<CheckPromoResponse?>>();
      container.listen(
        checkPromoProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(checkPromoProvider.notifier);

      // act
      await notifier.checkPromoCode(
        promoCode: 'WELCOME2026',
        dataPlanId: 'PLAN-001',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<CheckPromoResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<CheckPromoResponse?>(tResponse)),
      ]);

      verify(
        () =>
            mockUsecase.call(promoCode: 'WELCOME2026', dataPlanId: 'PLAN-001'),
      ).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockUsecase.call(
          promoCode: any(named: 'promoCode'),
          dataPlanId: any(named: 'dataPlanId'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build
      await container.read(checkPromoProvider.future);

      final listener = Listener<AsyncValue<CheckPromoResponse?>>();
      container.listen(
        checkPromoProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(checkPromoProvider.notifier);

      // act
      await notifier.checkPromoCode(
        promoCode: 'INVALID',
        dataPlanId: 'PLAN-001',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<CheckPromoResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(checkPromoProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
