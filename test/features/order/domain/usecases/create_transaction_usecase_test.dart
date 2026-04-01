import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/create_transaction_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late CreateTransactionUsecase usecase;

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = CreateTransactionUsecase(mockRepository);
  });

  test('should return CreateTransactionResponse on success', () async {
    final tResponse = CreateTransactionResponse(
      success: true,
      message: 'ok',
      data: CreateTransactionDataEntity(
        orderId: "ORD-TEST12345", // random string ID
        amount: 99999, // angka dummy
        paymentType: "VA", // contoh tipe pembayaran
        bank: "BCA", // nama bank dummy
        imageUrl: "https://example.com/img.png", // link gambar dummy
        vaNumber: "1234567890123456", // nomor VA dummy
        expiredAt: DateTime.now().add(
          const Duration(hours: 24), // expired 24 jam dari sekarang
        ),
      ),
    );
    when(
      () => mockRepository.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => Right(tResponse));

    final result = await usecase(
      deviceId: 'dev1',
      dataPlanId: 'plan1',
      paymentMethod: 'method1',
      promoCode: 'PROMO',
    );
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final result = await usecase(
      deviceId: 'dev1',
      dataPlanId: 'plan1',
      paymentMethod: 'method1',
      promoCode: 'PROMO',
    );
    expect(result.isLeft(), true);
  });
}
