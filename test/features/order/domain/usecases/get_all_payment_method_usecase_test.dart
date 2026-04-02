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

  final tResponse = PaymentMethodResponse(
    success: true,
    message: 'Payment methods fetched successfully',
    data: [tPaymentMethod],
  );

  setUp(() {
    mockRepository = MockTransactionRepository();
    usecase = GetAllPaymentMethodUsecase(mockRepository);
  });

  group('GetAllPaymentMethodUsecase', () {
    test('should call getAllPaymentMethod from repository', () async {
      // arrange
      when(() => mockRepository.getAllPaymentMethod())
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getAllPaymentMethod()).called(1);
    });

    test('should return Failure from repository when fetching fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch payment methods');
      when(() => mockRepository.getAllPaymentMethod())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
