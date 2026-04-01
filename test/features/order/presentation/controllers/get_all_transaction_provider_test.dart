import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:litenet/features/order/domain/usecases/get_all_transaction_method_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/get_all_transaction_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllTransactionUsecase extends Mock
    implements GetAllTransactionUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetAllTransactionUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetAllTransactionUsecase();
    container = ProviderContainer(
      overrides: [
        getAllTransactionUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should return TransactionResponse on success', () async {
    final tResponse = TransactionResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(() => mockUsecase()).thenAnswer((_) async => Right(tResponse));

    final notifier = container.read(getAllTransactionProvider.notifier);
    final result = await notifier.build();
    expect(result, tResponse);
  });

  test('should throw Failure on error', () async {
    when(
      () => mockUsecase(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(getAllTransactionProvider.notifier);
    expect(() => notifier.build(), throwsA(isA<Failure>()));
  });
}
