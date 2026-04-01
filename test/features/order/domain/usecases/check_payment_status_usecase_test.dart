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

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = CheckPaymentStatusUsecase(mockRepository);
  });

  test('should return CheckPaymentStatusResponse on success', () async {
    final tResponse = CheckPaymentStatusResponse(
      success: true,
      message: 'ok',
      data: CheckPaymentStatusDataEntity(
        id: "PAY-${DateTime.now().millisecondsSinceEpoch}", // ID unik dummy
        userId: "USR-0000", // user dummy
        orderId: "ORD-0000", // order dummy
        transactionStatus: "pending", // status default
        fraudStatus: "accept", // fraud status default
        bank: "BCA", // bank dummy
        expiredAt: DateTime.now().add(
          const Duration(hours: 24),
        ), // expired 24 jam dari sekarang
      ),
    );
    when(
      () => mockRepository.checkPaymentStatus(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase(orderId: 'ORD-1');
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.checkPaymentStatus(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase(orderId: 'ORD-1');
    expect(result, Left(failure));
  });
}
