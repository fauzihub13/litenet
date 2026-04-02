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

  final tResponse = CreateTransactionResponse(
    success: true,
    message: 'Transaction created successfully',
    data: CreateTransactionDataEntity(
      orderId: "ORD-20260402-001",
      amount: 150000,
      paymentType: "bank_transfer",
      bank: "BCA",
      imageUrl: "https://example.com/payment_instructions.png",
      vaNumber: "1234567890123456",
      expiredAt: DateTime(2026, 4, 3, 10, 0, 0),
    ),
  );

  final tParams = {
    'deviceId': 'DEV-001',
    'dataPlanId': 'PLAN-001',
    'paymentMethod': 'bca_va',
    'promoCode': 'WELCOME2026',
  };

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = CreateTransactionUsecase(mockRepository);
  });

  group('CreateTransactionUsecase', () {
    test('should call createTransaction from repository with correct parameters', () async {
      // arrange
      when(() => mockRepository.createTransaction(
            deviceId: any(named: 'deviceId'),
            dataPlanId: any(named: 'dataPlanId'),
            paymentMethod: any(named: 'paymentMethod'),
            promoCode: any(named: 'promoCode'),
          )).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(
        deviceId: tParams['deviceId']!,
        dataPlanId: tParams['dataPlanId']!,
        paymentMethod: tParams['paymentMethod']!,
        promoCode: tParams['promoCode']!,
      );

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.createTransaction(
            deviceId: tParams['deviceId']!,
            dataPlanId: tParams['dataPlanId']!,
            paymentMethod: tParams['paymentMethod']!,
            promoCode: tParams['promoCode']!,
          )).called(1);
    });

    test('should return Failure from repository when creation fails', () async {
      // arrange
      final tFailure = Failure(message: 'Insufficient balance');
      when(() => mockRepository.createTransaction(
            deviceId: any(named: 'deviceId'),
            dataPlanId: any(named: 'dataPlanId'),
            paymentMethod: any(named: 'paymentMethod'),
            promoCode: any(named: 'promoCode'),
          )).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(
        deviceId: tParams['deviceId']!,
        dataPlanId: tParams['dataPlanId']!,
        paymentMethod: tParams['paymentMethod']!,
        promoCode: tParams['promoCode']!,
      );

      // assert
      expect(result, Left(tFailure));
    });
  });
}
