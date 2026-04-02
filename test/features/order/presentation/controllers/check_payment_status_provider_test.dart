import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/usecases/check_payment_status_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/check_payment_status_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCheckPaymentStatusUsecase extends Mock
    implements CheckPaymentStatusUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockCheckPaymentStatusUsecase mockUsecase;
  late ProviderContainer container;

  final tResponse = CheckPaymentStatusResponse(
    success: true,
    message: 'Payment status checked successfully',
    data: CheckPaymentStatusDataEntity(
      id: "PAY-20260402-001",
      userId: "USR-001",
      orderId: "ORD-001",
      transactionStatus: "settlement",
      fraudStatus: "accept",
      bank: "BCA",
      expiredAt: DateTime(2026, 4, 3, 10, 0, 0),
    ),
  );

  final tFailure = Failure(message: 'Failed to check payment status');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<CheckPaymentStatusResponse?>());
    registerFallbackValue(AsyncData<CheckPaymentStatusResponse?>(tResponse));
  });

  setUp(() {
    mockUsecase = MockCheckPaymentStatusUsecase();
    container = ProviderContainer(
      overrides: [
        checkPaymentStatusUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CheckPaymentStatusProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(checkPaymentStatusProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Right(tResponse));

      // Wait for build
      await container.read(checkPaymentStatusProvider.future);

      final listener = Listener<AsyncValue<CheckPaymentStatusResponse?>>();
      container.listen(checkPaymentStatusProvider, listener.call, fireImmediately: true);

      final notifier = container.read(checkPaymentStatusProvider.notifier);

      // act
      await notifier.checkPaymentStatus(orderId: 'ORD-001');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<CheckPaymentStatusResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<CheckPaymentStatusResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call(orderId: 'ORD-001')).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Left(tFailure));

      // Wait for build
      await container.read(checkPaymentStatusProvider.future);

      final listener = Listener<AsyncValue<CheckPaymentStatusResponse?>>();
      container.listen(checkPaymentStatusProvider, listener.call, fireImmediately: true);

      final notifier = container.read(checkPaymentStatusProvider.notifier);

      // act
      await notifier.checkPaymentStatus(orderId: 'ORD-001');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<CheckPaymentStatusResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(checkPaymentStatusProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
