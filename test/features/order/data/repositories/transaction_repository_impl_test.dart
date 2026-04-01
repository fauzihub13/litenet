import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/datasources/transaction_datasource.dart';
import 'package:litenet/features/order/data/repositories/transaction_repository_impl.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionDatasource extends Mock implements TransactionDatasource {}

void main() {
  late MockTransactionDatasource mockDatasource;
  late TransactionRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockTransactionDatasource();
    repository = TransactionRepositoryImpl(
      transactionDatasource: mockDatasource,
    );
  });

  test(
    'should return CreateTransactionResponse when datasource returns success',
    () async {
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
        () => mockDatasource.createTransaction(
          deviceId: 'dev1',
          dataPlanId: 'plan1',
          paymentMethod: 'method1',
          promoCode: 'PROMO',
        ),
      ).thenAnswer((_) async => tResponse);

      final result = await repository.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      );
      expect(result, Right(tResponse));
      verify(
        () => mockDatasource.createTransaction(
          deviceId: 'dev1',
          dataPlanId: 'plan1',
          paymentMethod: 'method1',
          promoCode: 'PROMO',
        ),
      ).called(1);
    },
  );

  test('should return Failure when datasource throws', () async {
    when(
      () => mockDatasource.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).thenThrow(Exception('error'));

    final result = await repository.createTransaction(
      deviceId: 'dev1',
      dataPlanId: 'plan1',
      paymentMethod: 'method1',
      promoCode: 'PROMO',
    );
    expect(result.isLeft(), true);
    verify(
      () => mockDatasource.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).called(1);
  });

  test('should return Failure when datasource returns !success', () async {
    final tFailResponse = CreateTransactionResponse(
      success: false,
      message: 'Failed',
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
      () => mockDatasource.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => tFailResponse);

    final result = await repository.createTransaction(
      deviceId: 'dev1',
      dataPlanId: 'plan1',
      paymentMethod: 'method1',
      promoCode: 'PROMO',
    );
    result.fold((failure) {
      expect(failure, isA<Failure>());
      expect(failure.message, 'Failed');
    }, (_) => fail('Should not be success'));
    verify(
      () => mockDatasource.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).called(1);
  });
}
