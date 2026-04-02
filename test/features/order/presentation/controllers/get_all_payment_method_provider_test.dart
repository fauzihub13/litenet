import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:litenet/features/order/presentation/controllers/get_all_payment_method_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllPaymentMethodUsecase extends Mock
    implements GetAllPaymentMethodUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetAllPaymentMethodUsecase mockUsecase;
  late ProviderContainer container;

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

  final tFailure = Failure(message: 'Failed to fetch payment methods');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<PaymentMethodResponse>());
    registerFallbackValue(AsyncData<PaymentMethodResponse>(tResponse));
  });

  setUp(() {
    mockUsecase = MockGetAllPaymentMethodUsecase();
    container = ProviderContainer(
      overrides: [
        getAllPaymentMethodUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetAllPaymentMethodProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getAllPaymentMethodProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getAllPaymentMethodProvider.future);

      final listener = Listener<AsyncValue<PaymentMethodResponse?>>();
      container.listen(
        getAllPaymentMethodProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllPaymentMethodProvider.notifier);

      // act
      await notifier.fetchAllPaymentMethod();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<PaymentMethodResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<PaymentMethodResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getAllPaymentMethodProvider.future);

      final listener = Listener<AsyncValue<PaymentMethodResponse?>>();
      container.listen(
        getAllPaymentMethodProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllPaymentMethodProvider.notifier);

      // act
      await notifier.fetchAllPaymentMethod();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<PaymentMethodResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getAllPaymentMethodProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
