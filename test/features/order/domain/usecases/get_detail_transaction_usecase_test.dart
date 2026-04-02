import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/get_detail_transaction_method_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late GetDetailTransactionUsecase usecase;

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

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = GetDetailTransactionUsecase(mockRepository);
  });

  group('GetDetailTransactionUsecase', () {
    test('should call getDetailTransaction from repository with correct orderId', () async {
      // arrange
      when(() => mockRepository.getDetailTransaction(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Right(tDetailResponse));

      // act
      final result = await usecase(orderId: 'ORD-001');

      // assert
      expect(result, Right(tDetailResponse));
      verify(() => mockRepository.getDetailTransaction(orderId: 'ORD-001')).called(1);
    });

    test('should return Failure from repository when fetching fails', () async {
      // arrange
      final tFailure = Failure(message: 'Transaction not found');
      when(() => mockRepository.getDetailTransaction(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(orderId: 'ORD-001');

      // assert
      expect(result, Left(tFailure));
    });
  });
}
