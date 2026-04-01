import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:litenet/features/order/domain/usecases/check_payment_status_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/check_payment_status_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCheckPaymentStatusUsecase extends Mock
    implements CheckPaymentStatusUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCheckPaymentStatusUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockCheckPaymentStatusUsecase();
    container = ProviderContainer(
      overrides: [
        checkPaymentStatusUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should emit loading and then data on success', () async {
    final tResponse = CheckPaymentStatusResponse(
      success: true,
      message: 'ok',
      data: CheckPaymentStatusDataEntity(
        id: "PAY-${DateTime.now().millisecondsSinceEpoch}", // ID unik berbasis timestamp
        userId: "USR-12345", // user dummy
        orderId: "ORD-98765", // order dummy
        transactionStatus: "settlement", // contoh status transaksi
        fraudStatus: "accept", // contoh status fraud
        bank: "BNI", // bank dummy
        expiredAt: DateTime.now().add(
          const Duration(hours: 12),
        ), // expired 12 jam dari sekarang
      ),
    );
    when(
      () => mockUsecase(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Right(tResponse));

    final notifier = container.read(checkPaymentStatusProvider.notifier);
    final future = notifier.checkPaymentStatus(orderId: 'ORD-1');
    expect(container.read(checkPaymentStatusProvider), isA<AsyncLoading>());
    await future;
    CheckPaymentStatusResponse? value;
    for (var i = 0; i < 100; i++) {
      final state = container.read(checkPaymentStatusProvider);
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
      () => mockUsecase(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(checkPaymentStatusProvider.notifier);
    final future = notifier.checkPaymentStatus(orderId: 'ORD-1');
    expect(container.read(checkPaymentStatusProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(checkPaymentStatusProvider).hasError, true);
  });
}
