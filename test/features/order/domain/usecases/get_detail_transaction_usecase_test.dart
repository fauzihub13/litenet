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

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = GetDetailTransactionUsecase(mockRepository);
  });

  test('should return DetailTransactionResponse on success', () async {
    final tResponse = DetailTransactionResponse(
      success: true,
      message: 'ok',
      data: DetailTransactionDataEntity(
        id: "TX-${DateTime.now().millisecondsSinceEpoch}",
        orderId: "ORD-${DateTime.now().microsecondsSinceEpoch}",
        packageName: "Paket Internet Unlimited",
        capacity: "10GB",
        transactionStatus: [
          "pending",
          "settlement",
          "cancel",
        ].elementAt(DateTime.now().second % 3),
        grossAmount: (10000 + DateTime.now().second * 1000),
        bankCode: [
          "BCA",
          "BNI",
          "BRI",
          "MANDIRI",
        ].elementAt(DateTime.now().millisecond % 4),
        bankName: "Bank Dummy",
        bankImageUrl: "https://dummyimage.com/100x100/000/fff.png",
        vaNumber: "1234567890${DateTime.now().second}",
        createdAt: DateTime.now(),
        expiredAt: DateTime.now().add(const Duration(hours: 24)),
      ),
    );
    when(
      () => mockRepository.getDetailTransaction(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase(orderId: 'ORD-1');
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.getDetailTransaction(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase(orderId: 'ORD-1');
    expect(result, Left(failure));
  });
}
