import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/domain/usecases/get_detail_transaction_method_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/get_detail_transaction_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDetailTransactionUsecase extends Mock
    implements GetDetailTransactionUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetDetailTransactionUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetDetailTransactionUsecase();
    container = ProviderContainer(
      overrides: [
        getDetailTransactionUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should return DetailTransactionResponse on success', () async {
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
      () => mockUsecase(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Right(tResponse));

    final result = await container.read(
      getDetailTransactionProvider(orderId: 'ORD-1').future,
    );
    expect(result, tResponse);
  });

  test(
    'should throw StateError on error (provider disposed before emitting value)',
    () async {
      when(
        () => mockUsecase(orderId: 'ORD-1'),
      ).thenAnswer((_) async => Left(Failure(message: 'error')));

      expect(
        () => container.read(
          getDetailTransactionProvider(orderId: 'ORD-1').future,
        ),
        throwsA(isA<StateError>()),
      );
    },
  );
}
