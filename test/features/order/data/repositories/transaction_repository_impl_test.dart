import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
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

  final tCreateResponse = CreateTransactionResponse(
    success: true,
    message: 'Transaction created successfully',
    data: CreateTransactionDataEntity(
      orderId: "ORD-001",
      amount: 150000,
      paymentType: "bank_transfer",
      bank: "BCA",
      imageUrl: "https://example.com/payment.png",
      vaNumber: "1234567890123456",
      expiredAt: DateTime(2026, 4, 3, 10, 0, 0),
    ),
  );

  final tPaymentMethod = PaymentMethodDataEntity(
    id: 'PM-001',
    code: 'va_bca',
    name: 'BCA Virtual Account',
    type: 'bank_transfer',
    provider: 'midtrans',
    isActive: true,
    image: 'https://example.com/bca.png',
    imageUrl: 'https://example.com/bca.png',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    deletedAt: null,
  );

  final tPaymentMethodResponse = PaymentMethodResponse(
    success: true,
    message: 'Payment methods fetched successfully',
    data: [tPaymentMethod],
  );

  final tCheckStatusResponse = CheckPaymentStatusResponse(
    success: true,
    message: 'Payment status checked successfully',
    data: CheckPaymentStatusDataEntity(
      id: "PAY-001",
      userId: "USR-001",
      orderId: "ORD-001",
      transactionStatus: "settlement",
      fraudStatus: "accept",
      bank: "BCA",
      expiredAt: DateTime(2026, 4, 3, 10, 0, 0),
    ),
  );

  final tTransactionData = TransactionDataEntity(
    id: 'tr-001',
    orderId: 'ORD-001',
    packageName: 'Unlimited 100GB',
    capacity: '100GB',
    transactionStatus: 'SETTLEMENT',
    grossAmount: 150000,
    createdAt: DateTime(2026, 4, 2, 10, 0, 0),
  );

  final tTransactionResponse = TransactionResponse(
    success: true,
    message: 'Transactions retrieved successfully',
    data: [tTransactionData],
  );

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
    mockDatasource = MockTransactionDatasource();
    repository = TransactionRepositoryImpl(
      transactionDatasource: mockDatasource,
    );
  });

  group('TransactionRepositoryImpl', () {
    group('createTransaction', () {
      test(
        'should return CreateTransactionResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.createTransaction(
              deviceId: any(named: 'deviceId'),
              dataPlanId: any(named: 'dataPlanId'),
              paymentMethod: any(named: 'paymentMethod'),
              promoCode: any(named: 'promoCode'),
            ),
          ).thenAnswer((_) async => tCreateResponse);

          // act
          final result = await repository.createTransaction(
            deviceId: 'DEV-001',
            dataPlanId: 'PLAN-001',
            paymentMethod: 'bca_va',
            promoCode: 'PROMO',
          );

          // assert
          expect(result, Right(tCreateResponse));
        },
      );

      test('should return Failure when datasource throws', () async {
        // arrange
        when(
          () => mockDatasource.createTransaction(
            deviceId: any(named: 'deviceId'),
            dataPlanId: any(named: 'dataPlanId'),
            paymentMethod: any(named: 'paymentMethod'),
            promoCode: any(named: 'promoCode'),
          ),
        ).thenThrow(Exception('Server error'));

        // act
        final result = await repository.createTransaction(
          deviceId: 'DEV-001',
          dataPlanId: 'PLAN-001',
          paymentMethod: 'bca_va',
          promoCode: 'PROMO',
        );

        // assert
        expect(result.isLeft(), true);
      });
    });

    group('getAllPaymentMethod', () {
      test(
        'should return PaymentMethodResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getAllPaymentMethod(),
          ).thenAnswer((_) async => tPaymentMethodResponse);

          // act
          final result = await repository.getAllPaymentMethod();

          // assert
          expect(result, Right(tPaymentMethodResponse));
        },
      );
    });

    group('checkPaymentStatus', () {
      test(
        'should return CheckPaymentStatusResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.checkPaymentStatus(
              orderId: any(named: 'orderId'),
            ),
          ).thenAnswer((_) async => tCheckStatusResponse);

          // act
          final result = await repository.checkPaymentStatus(
            orderId: 'ORD-001',
          );

          // assert
          expect(result, Right(tCheckStatusResponse));
        },
      );
    });

    group('getAllTransaction', () {
      test(
        'should return TransactionResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getAllTransaction(),
          ).thenAnswer((_) async => tTransactionResponse);

          // act
          final result = await repository.getAllTransaction();

          // assert
          expect(result, Right(tTransactionResponse));
        },
      );
    });

    group('getDetailTransaction', () {
      test(
        'should return DetailTransactionResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getDetailTransaction(
              orderId: any(named: 'orderId'),
            ),
          ).thenAnswer((_) async => tDetailResponse);

          // act
          final result = await repository.getDetailTransaction(
            orderId: 'ORD-001',
          );

          // assert
          expect(result, Right(tDetailResponse));
        },
      );
    });

    group('downloadInvoice', () {
      test('should return file path when datasource returns success', () async {
        // arrange
        when(
          () => mockDatasource.downloadInvoice(orderId: any(named: 'orderId')),
        ).thenAnswer((_) async => '/path/to/invoice.pdf');

        // act
        final result = await repository.downloadInvoice(orderId: 'ORD-001');

        // assert
        expect(result, Right('/path/to/invoice.pdf'));
      });
    });
  });
}
