import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/get_all_transaction_method_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late GetAllTransactionUsecase usecase;

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = GetAllTransactionUsecase(mockRepository);
  });

  test('should return TransactionResponse on success', () async {
    final tResponse = TransactionResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(
      () => mockRepository.getAllTransaction(),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase();
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.getAllTransaction(),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase();
    expect(result, Left(failure));
  });
}
