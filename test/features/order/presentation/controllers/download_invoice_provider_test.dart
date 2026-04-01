import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/usecases/download_invoice_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/download_invoice_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockDownloadInvoiceUsecase extends Mock
    implements DownloadInvoiceUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockDownloadInvoiceUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockDownloadInvoiceUsecase();
    container = ProviderContainer(
      overrides: [
        downloadInvoiceUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should emit loading and then data on success', () async {
    when(
      () => mockUsecase(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Right('/tmp/invoice.pdf'));

    final notifier = container.read(downloadInvoiceProvider.notifier);
    final future = notifier.executeDownload('ORD-1');
    expect(container.read(downloadInvoiceProvider), isA<AsyncLoading>());
    await future;
    String? value;
    for (var i = 0; i < 100; i++) {
      final state = container.read(downloadInvoiceProvider);
      if (!state.isLoading) {
        value = state.value;
        break;
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    expect(value, isNotNull);
    expect(value, '/tmp/invoice.pdf');
  });

  test('should emit loading and then error on failure', () async {
    when(
      () => mockUsecase(orderId: 'ORD-1'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(downloadInvoiceProvider.notifier);
    final future = notifier.executeDownload('ORD-1');
    expect(container.read(downloadInvoiceProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(downloadInvoiceProvider).hasError, true);
  });
}
