import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/domain/usecases/get_detail_transaction_method_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/get_detail_transaction_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDetailTransactionUsecase extends Mock
    implements GetDetailTransactionUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetDetailTransactionUsecase mockUsecase;
  late ProviderContainer container;

  final tDetailResponse = DetailTransactionResponse(
    success: true,
    message: 'Detail fetched successfully',
    data: DetailTransactionDataEntity(
      id: "TX-001",
      orderId: "ORD-001",
      packageName: "Unlimited 100GB",
      capacity: "100GB",
      transactionStatus: "SETTLEMENT",
      grossAmount: 150000,
      bankCode: "BCA",
      bankName: "BCA Virtual Account",
      bankImageUrl: "https://example.com/bca.png",
      vaNumber: "1234567890123456",
      createdAt: DateTime(2026, 4, 2, 10, 0, 0),
      expiredAt: DateTime(2026, 4, 3, 10, 0, 0),
    ),
  );

  final tFailure = Failure(message: 'Transaction not found');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<DetailTransactionResponse>());
    registerFallbackValue(
      AsyncData<DetailTransactionResponse>(tDetailResponse),
    );
  });

  setUp(() {
    mockUsecase = MockGetDetailTransactionUsecase();
    container = ProviderContainer(
      overrides: [
        getDetailTransactionUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetDetailTransactionProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(
        getDetailTransactionProvider(orderId: 'ORD-001').future,
      );
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(
        () => mockUsecase.call(orderId: 'ORD-001'),
      ).thenAnswer((_) async => Right(tDetailResponse));

      // Wait for build to finish
      await container.read(
        getDetailTransactionProvider(orderId: 'ORD-001').future,
      );

      final listener = Listener<AsyncValue<DetailTransactionResponse?>>();
      container.listen(
        getDetailTransactionProvider(orderId: 'ORD-001'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getDetailTransactionProvider(orderId: 'ORD-001').notifier,
      );

      // act
      await notifier.fetchDetailTransaction('ORD-001');

      // assert
      verifyInOrder([
        () =>
            listener(any(), const AsyncData<DetailTransactionResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(
          any(),
          AsyncData<DetailTransactionResponse?>(tDetailResponse),
        ),
      ]);

      verify(() => mockUsecase.call(orderId: 'ORD-001')).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockUsecase.call(orderId: 'ORD-001'),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(
        getDetailTransactionProvider(orderId: 'ORD-001').future,
      );

      final listener = Listener<AsyncValue<DetailTransactionResponse?>>();
      container.listen(
        getDetailTransactionProvider(orderId: 'ORD-001'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getDetailTransactionProvider(orderId: 'ORD-001').notifier,
      );

      // act
      await notifier.fetchDetailTransaction('ORD-001');

      // assert
      verifyInOrder([
        () =>
            listener(any(), const AsyncData<DetailTransactionResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(
        getDetailTransactionProvider(orderId: 'ORD-001'),
      );
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
