import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/get_all_transaction_method_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late GetAllTransactionUsecase usecase;

  final tTransactionData = TransactionDataEntity(
    id: 'tr-001',
    orderId: 'ORD-001',
    packageName: 'Unlimited 100GB',
    capacity: '100GB',
    transactionStatus: 'SETTLEMENT',
    grossAmount: 150000,
    createdAt: DateTime(2026, 4, 2, 10, 0, 0),
  );

  final tResponse = TransactionResponse(
    success: true,
    message: 'Transactions retrieved successfully',
    data: [tTransactionData],
  );

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = GetAllTransactionUsecase(mockRepository);
  });

  group('GetAllTransactionUsecase', () {
    test('should call getAllTransaction from repository', () async {
      // arrange
      when(() => mockRepository.getAllTransaction())
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getAllTransaction()).called(1);
    });

    test('should return Failure from repository when fetching transactions fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch transactions');
      when(() => mockRepository.getAllTransaction())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
