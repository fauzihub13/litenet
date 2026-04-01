import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/datasources/transaction_datasource.dart';
import 'package:litenet/features/order/data/repositories/transaction_repository_impl.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
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

  group('createTransaction', () {
    test(
      'should return CreateTransactionResponse when datasource returns success',
      () async {
        final tResponse = CreateTransactionResponse(
          success: true,
          message: 'ok',
          data: CreateTransactionDataEntity(
            orderId: "ORD-TEST12345",
            amount: 99999,
            paymentType: "VA",
            bank: "BCA",
            imageUrl: "https://example.com/img.png",
            vaNumber: "1234567890123456",
            expiredAt: DateTime.now().add(const Duration(hours: 24)),
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
          orderId: "ORD-TEST12345",
          amount: 99999,
          paymentType: "VA",
          bank: "BCA",
          imageUrl: "https://example.com/img.png",
          vaNumber: "1234567890123456",
          expiredAt: DateTime.now().add(const Duration(hours: 24)),
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
  });

  group('getAllPaymentMethod', () {
    test(
      'should return PaymentMethodResponse when datasource returns success',
      () async {
        final tResponse = PaymentMethodResponse(
          success: true,
          message: 'ok',
          data: [],
        );
        when(
          () => mockDatasource.getAllPaymentMethod(),
        ).thenAnswer((_) async => tResponse);
        final result = await repository.getAllPaymentMethod();
        expect(result, Right(tResponse));
        verify(() => mockDatasource.getAllPaymentMethod()).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.getAllPaymentMethod(),
      ).thenThrow(Exception('error'));
      final result = await repository.getAllPaymentMethod();
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getAllPaymentMethod()).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = PaymentMethodResponse(
        success: false,
        message: 'Failed',
        data: [],
      );
      when(
        () => mockDatasource.getAllPaymentMethod(),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.getAllPaymentMethod();
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(() => mockDatasource.getAllPaymentMethod()).called(1);
    });
  });

  group('checkPaymentStatus', () {
    test(
      'should return CheckPaymentStatusResponse when datasource returns success',
      () async {
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
          () => mockDatasource.checkPaymentStatus(orderId: 'order1'),
        ).thenAnswer((_) async => tResponse);
        final result = await repository.checkPaymentStatus(orderId: 'order1');
        expect(result, Right(tResponse));
        verify(
          () => mockDatasource.checkPaymentStatus(orderId: 'order1'),
        ).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.checkPaymentStatus(orderId: 'order1'),
      ).thenThrow(Exception('error'));
      final result = await repository.checkPaymentStatus(orderId: 'order1');
      expect(result.isLeft(), true);
      verify(
        () => mockDatasource.checkPaymentStatus(orderId: 'order1'),
      ).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = CheckPaymentStatusResponse(
        success: false,
        message: 'Failed',
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
        () => mockDatasource.checkPaymentStatus(orderId: 'order1'),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.checkPaymentStatus(orderId: 'order1');
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(
        () => mockDatasource.checkPaymentStatus(orderId: 'order1'),
      ).called(1);
    });
  });

  group('getAllTransaction', () {
    test(
      'should return TransactionResponse when datasource returns success',
      () async {
        final tResponse = TransactionResponse(
          success: true,
          message: 'ok',
          data: [],
        );
        when(
          () => mockDatasource.getAllTransaction(),
        ).thenAnswer((_) async => tResponse);
        final result = await repository.getAllTransaction();
        expect(result, Right(tResponse));
        verify(() => mockDatasource.getAllTransaction()).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.getAllTransaction(),
      ).thenThrow(Exception('error'));
      final result = await repository.getAllTransaction();
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getAllTransaction()).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = TransactionResponse(
        success: false,
        message: 'Failed',
        data: [],
      );
      when(
        () => mockDatasource.getAllTransaction(),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.getAllTransaction();
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(() => mockDatasource.getAllTransaction()).called(1);
    });
  });

  group('getDetailTransaction', () {
    test(
      'should return DetailTransactionResponse when datasource returns success',
      () async {
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
          () => mockDatasource.getDetailTransaction(orderId: 'order1'),
        ).thenAnswer((_) async => tResponse);
        final result = await repository.getDetailTransaction(orderId: 'order1');
        expect(result, Right(tResponse));
        verify(
          () => mockDatasource.getDetailTransaction(orderId: 'order1'),
        ).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.getDetailTransaction(orderId: 'order1'),
      ).thenThrow(Exception('error'));
      final result = await repository.getDetailTransaction(orderId: 'order1');
      expect(result.isLeft(), true);
      verify(
        () => mockDatasource.getDetailTransaction(orderId: 'order1'),
      ).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = DetailTransactionResponse(
        success: false,
        message: 'Failed',
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
        () => mockDatasource.getDetailTransaction(orderId: 'order1'),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.getDetailTransaction(orderId: 'order1');
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(
        () => mockDatasource.getDetailTransaction(orderId: 'order1'),
      ).called(1);
    });
  });

  group('downloadInvoice', () {
    test('should return file path when datasource returns success', () async {
      when(
        () => mockDatasource.downloadInvoice(orderId: 'order1'),
      ).thenAnswer((_) async => '/path/to/order1.pdf');
      final result = await repository.downloadInvoice(orderId: 'order1');
      expect(result, Right('/path/to/order1.pdf'));
      verify(() => mockDatasource.downloadInvoice(orderId: 'order1')).called(1);
    });

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.downloadInvoice(orderId: 'order1'),
      ).thenThrow(Exception('error'));
      final result = await repository.downloadInvoice(orderId: 'order1');
      expect(result.isLeft(), true);
      verify(() => mockDatasource.downloadInvoice(orderId: 'order1')).called(1);
    });
  });
}
