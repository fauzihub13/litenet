import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';
import 'package:litenet/features/order/domain/usecases/create_transaction_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/create_transaction_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateTransactionUsecase extends Mock
    implements CreateTransactionUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCreateTransactionUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockCreateTransactionUsecase();
    container = ProviderContainer(
      overrides: [
        createTransactionUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should emit loading and then data on success', () async {
    final tResponse = CreateTransactionResponse(
      success: true,
      message: 'ok',
      data: CreateTransactionDataEntity(
        orderId: "ORD-TEST12345", // random string ID
        amount: 99999, // angka dummy
        paymentType: "VA", // contoh tipe pembayaran
        bank: "BCA", // nama bank dummy
        imageUrl: "https://example.com/img.png", // link gambar dummy
        vaNumber: "1234567890123456", // nomor VA dummy
        expiredAt: DateTime.now().add(
          const Duration(hours: 24), // expired 24 jam dari sekarang
        ),
      ),
    );
    when(
      () => mockUsecase(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => Right(tResponse));

    final notifier = container.read(createTransactionProvider.notifier);
    final future = notifier.createTransaction(
      deviceId: 'dev1',
      dataPlanId: 'plan1',
      paymentMethod: 'method1',
      promoCode: 'PROMO',
    );
    expect(container.read(createTransactionProvider), isA<AsyncLoading>());
    await future;
    CreateTransactionResponse? value;
    for (var i = 0; i < 100; i++) {
      final state = container.read(createTransactionProvider);
      if (!state.isLoading) {
        value = state.value;
        break;
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    expect(value, isNotNull);
    expect(value, tResponse);
  });

  test('should emit loading and then error on failure', () async {
    when(
      () => mockUsecase(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(createTransactionProvider.notifier);
    final future = notifier.createTransaction(
      deviceId: 'dev1',
      dataPlanId: 'plan1',
      paymentMethod: 'method1',
      promoCode: 'PROMO',
    );
    expect(container.read(createTransactionProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(createTransactionProvider).hasError, true);
  });
}
