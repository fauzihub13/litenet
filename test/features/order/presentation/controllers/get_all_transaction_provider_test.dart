import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:litenet/features/order/domain/usecases/get_all_transaction_method_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/get_all_transaction_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllTransactionUsecase extends Mock
    implements GetAllTransactionUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetAllTransactionUsecase mockUsecase;
  late ProviderContainer container;

  final tTransactionData = TransactionDataEntity(
    id: 'tr-123',
    orderId: 'ORD-20231027-001',
    packageName: 'Super Fast 100GB',
    capacity: '100GB',
    transactionStatus: 'SETTLEMENT',
    grossAmount: 150000,
    createdAt: DateTime(2023, 10, 27, 10, 0, 0),
  );

  final tResponse = TransactionResponse(
    success: true,
    message: 'Transactions retrieved successfully',
    data: [tTransactionData],
  );

  final tFailure = Failure(message: 'Failed to fetch payment methods');

  setUpAll(() {
    registerFallbackValue(const AsyncValue<TransactionResponse>.loading());
  });

  setUp(() {
    mockUsecase = MockGetAllTransactionUsecase();
    container = ProviderContainer(
      overrides: [
        getAllTransactionUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('getAllTransactionProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getAllTransactionProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getAllTransactionProvider.future);

      final listener = Listener<AsyncValue<TransactionResponse?>>();
      container.listen(
        getAllTransactionProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllTransactionProvider.notifier);

      // act
      await notifier.fetchAllTransaction();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<TransactionResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<TransactionResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getAllTransactionProvider.future);

      final listener = Listener<AsyncValue<TransactionResponse?>>();
      container.listen(
        getAllTransactionProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllTransactionProvider.notifier);

      // act
      await notifier.fetchAllTransaction();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<TransactionResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getAllTransactionProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });

    // test('should return TransactionResponse on success', () async {
    //   // arrange
    //   when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

    //   // listen to the provider
    //   container.listen(
    //     getAllTransactionProvider,
    //     listener.call,
    //     fireImmediately: true,
    //   );

    //   // wait for initialization
    //   await container.read(getAllTransactionProvider.future);

    //   // assert
    //   verifyInOrder([
    //     () => listener(any(), any(that: isA<AsyncLoading<TransactionResponse>>())),
    //     () => listener(any(), AsyncValue.data(tResponse)),
    //   ]);
    //   verify(() => mockUsecase.call()).called(1);
    // });

    // test('should emit AsyncError when usecase returns Failure', () async {
    //   // arrange
    //   final tFailure = Failure(message: 'Internal Server Error');
    //   when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

    //   // listen to the provider
    //   container.listen(
    //     getAllTransactionProvider,
    //     listener.call,
    //     fireImmediately: true,
    //   );

    //   // wait for initialization (it will throw but we catch it or ignore)
    //   try {
    //     await container.read(getAllTransactionProvider.future);
    //   } catch (_) {}

    //   // assert
    //   verifyInOrder([
    //     () => listener(any(), any(that: isA<AsyncLoading<TransactionResponse>>())),
    //     () => listener(
    //           any(),
    //           any(that: isA<AsyncError<TransactionResponse>>()),
    //         ),
    //   ]);
    //   verify(() => mockUsecase.call()).called(1);
    // });
  });
}
