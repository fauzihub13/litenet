import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/usecases/create_transaction_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/create_transaction_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateTransactionUsecase extends Mock implements CreateTransactionUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockCreateTransactionUsecase mockUsecase;
  late ProviderContainer container;

  final tResponse = CreateTransactionResponse(
    success: true,
    message: 'Transaction created successfully',
    data: CreateTransactionDataEntity(
      orderId: "ORD-20260402-001",
      amount: 150000,
      paymentType: "bank_transfer",
      bank: "BCA",
      imageUrl: "https://example.com/payment_instructions.png",
      vaNumber: "1234567890123456",
      expiredAt: DateTime(2026, 4, 3, 10, 0, 0),
    ),
  );

  final tFailure = Failure(message: 'Insufficient balance');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<CreateTransactionResponse?>());
    registerFallbackValue(AsyncData<CreateTransactionResponse?>(tResponse));
  });

  setUp(() {
    mockUsecase = MockCreateTransactionUsecase();
    container = ProviderContainer(
      overrides: [
        createTransactionUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CreateTransactionProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(createTransactionProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call(
            deviceId: any(named: 'deviceId'),
            dataPlanId: any(named: 'dataPlanId'),
            paymentMethod: any(named: 'paymentMethod'),
            promoCode: any(named: 'promoCode'),
          )).thenAnswer((_) async => Right(tResponse));

      // Wait for build
      await container.read(createTransactionProvider.future);

      final listener = Listener<AsyncValue<CreateTransactionResponse?>>();
      container.listen(createTransactionProvider, listener.call, fireImmediately: true);

      final notifier = container.read(createTransactionProvider.notifier);

      // act
      await notifier.createTransaction(
        deviceId: 'DEV-001',
        dataPlanId: 'PLAN-001',
        paymentMethod: 'bca_va',
        promoCode: 'WELCOME2026',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<CreateTransactionResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<CreateTransactionResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call(
            deviceId: 'DEV-001',
            dataPlanId: 'PLAN-001',
            paymentMethod: 'bca_va',
            promoCode: 'WELCOME2026',
          )).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call(
            deviceId: any(named: 'deviceId'),
            dataPlanId: any(named: 'dataPlanId'),
            paymentMethod: any(named: 'paymentMethod'),
            promoCode: any(named: 'promoCode'),
          )).thenAnswer((_) async => Left(tFailure));

      // Wait for build
      await container.read(createTransactionProvider.future);

      final listener = Listener<AsyncValue<CreateTransactionResponse?>>();
      container.listen(createTransactionProvider, listener.call, fireImmediately: true);

      final notifier = container.read(createTransactionProvider.notifier);

      // act
      await notifier.createTransaction(
        deviceId: 'DEV-001',
        dataPlanId: 'PLAN-001',
        paymentMethod: 'bca_va',
        promoCode: 'WELCOME2026',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<CreateTransactionResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(createTransactionProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
