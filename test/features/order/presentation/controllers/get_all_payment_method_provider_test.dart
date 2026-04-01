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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetAllPaymentMethodUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetAllPaymentMethodUsecase();
    container = ProviderContainer(
      overrides: [
        getAllPaymentMethodUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should return PaymentMethodResponse on success', () async {
    final tResponse = PaymentMethodResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(() => mockUsecase()).thenAnswer((_) async => Right(tResponse));

    final notifier = container.read(getAllPaymentMethodProvider.notifier);
    final result = await notifier.build();
    expect(result, tResponse);
  });

  test('should throw Failure on error', () async {
    when(
      () => mockUsecase(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(getAllPaymentMethodProvider.notifier);
    expect(() => notifier.build(), throwsA(isA<Failure>()));
  });
}
