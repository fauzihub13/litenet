import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/check_payment_status_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late CheckPaymentStatusUsecase usecase;

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

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = CheckPaymentStatusUsecase(mockRepository);
  });

  group('CheckPaymentStatusUsecase', () {
    test('should call checkPaymentStatus from repository with correct orderId', () async {
      // arrange
      when(() => mockRepository.checkPaymentStatus(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(orderId: 'ORD-001');

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.checkPaymentStatus(orderId: 'ORD-001')).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Network error');
      when(() => mockRepository.checkPaymentStatus(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(orderId: 'ORD-001');

      // assert
      expect(result, Left(tFailure));
    });
  });
}
