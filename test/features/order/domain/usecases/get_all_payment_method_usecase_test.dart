import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late GetAllPaymentMethodUsecase usecase;

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = GetAllPaymentMethodUsecase(mockRepository);
  });

  test('should return PaymentMethodResponse on success', () async {
    final tResponse = PaymentMethodResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(
      () => mockRepository.getAllPaymentMethod(),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase();
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.getAllPaymentMethod(),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase();
    expect(result, Left(failure));
  });
}
