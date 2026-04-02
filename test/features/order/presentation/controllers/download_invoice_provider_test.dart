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

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockDownloadInvoiceUsecase mockUsecase;
  late ProviderContainer container;

  final tFilePath = '/downloads/invoice_ORD-001.pdf';
  final tFailure = Failure(message: 'Failed to download invoice');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<String?>());
    registerFallbackValue(AsyncData<String?>(tFilePath));
  });

  setUp(() {
    mockUsecase = MockDownloadInvoiceUsecase();
    container = ProviderContainer(
      overrides: [
        downloadInvoiceUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('DownloadInvoiceProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(downloadInvoiceProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Right(tFilePath));

      // Wait for build
      await container.read(downloadInvoiceProvider.future);

      final listener = Listener<AsyncValue<String?>>();
      container.listen(downloadInvoiceProvider, listener.call, fireImmediately: true);

      final notifier = container.read(downloadInvoiceProvider.notifier);

      // act
      await notifier.executeDownload('ORD-001');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<String?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<String?>(tFilePath)),
      ]);

      verify(() => mockUsecase.call(orderId: 'ORD-001')).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call(orderId: any(named: 'orderId')))
          .thenAnswer((_) async => Left(tFailure));

      // Wait for build
      await container.read(downloadInvoiceProvider.future);

      final listener = Listener<AsyncValue<String?>>();
      container.listen(downloadInvoiceProvider, listener.call, fireImmediately: true);

      final notifier = container.read(downloadInvoiceProvider.notifier);

      // act
      await notifier.executeDownload('ORD-001');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<String?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(downloadInvoiceProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
