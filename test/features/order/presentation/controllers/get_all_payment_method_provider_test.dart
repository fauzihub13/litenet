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
    test(
      'should fetch payment methods and emit AsyncData on success',
      () async {
        // arrange
        when(
          () => mockUsecase.call(),
        ).thenAnswer((_) async => Right(tResponse));

        final listener = Listener<AsyncValue<PaymentMethodResponse>>();
        container.listen(
          getAllPaymentMethodProvider,
          listener.call,
          fireImmediately: true,
        );

        // act
        final state = await container.read(getAllPaymentMethodProvider.future);

        // assert
        expect(state, tResponse);
        verify(() => mockUsecase.call()).called(1);

        verifyInOrder([
          () => listener(any(), any(that: isA<AsyncLoading>())),
          () => listener(any(), AsyncData<PaymentMethodResponse>(tResponse)),
        ]);
      },
    );

    test('should emit AsyncError when fetching fails', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      final listener = Listener<AsyncValue<PaymentMethodResponse>>();
      container.listen(
        getAllPaymentMethodProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      try {
        await container.read(getAllPaymentMethodProvider.future);
      } catch (e) {
        expect(e, tFailure);
      }

      // assert
      final finalState = container.read(getAllPaymentMethodProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
