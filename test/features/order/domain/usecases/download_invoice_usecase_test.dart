import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:litenet/features/order/domain/usecases/download_invoice_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockRepository;
  late DownloadInvoiceUsecase usecase;

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = DownloadInvoiceUsecase(mockRepository);
  });

  test('should return file path on success', () async {
    when(
      () => mockRepository.downloadInvoice(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Right('/path/to/invoice.pdf'));
    final result = await usecase(orderId: 'ORD-1');
    expect(result, Right('/path/to/invoice.pdf'));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.downloadInvoice(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase(orderId: 'ORD-1');
    expect(result, Left(failure));
  });
}
