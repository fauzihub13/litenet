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

  final tFilePath = '/downloads/invoice_ORD-001.pdf';

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = DownloadInvoiceUsecase(mockRepository);
  });

  group('DownloadInvoiceUsecase', () {
    test('should call downloadInvoice from repository with correct orderId', () async {
      // arrange
      when(() => mockRepository.downloadInvoice(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Right(tFilePath));

      // act
      final result = await usecase(orderId: 'ORD-001');

      // assert
      expect(result, Right(tFilePath));
      verify(() => mockRepository.downloadInvoice(orderId: 'ORD-001')).called(1);
    });

    test('should return Failure from repository when download fails', () async {
      // arrange
      final tFailure = Failure(message: 'Download failed');
      when(() => mockRepository.downloadInvoice(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(orderId: 'ORD-001');

      // assert
      expect(result, Left(tFailure));
    });
  });
}
