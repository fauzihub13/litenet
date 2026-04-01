import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/data/di/usecase_provider.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/domain/usecases/get_promo_usecase.dart';
import 'package:litenet/features/promo/presentation/controllers/get_promo_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPromoUsecase extends Mock implements GetPromoUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetPromoUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetPromoUsecase();
    container = ProviderContainer(
      overrides: [
        getPromoUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should return PromoResponse on success', () async {
    final tPromoResponse = PromoResponse(success: true, message: 'ok', data: []);
    when(() => mockUsecase()).thenAnswer((_) async => Right(tPromoResponse));

    final notifier = container.read(getPromoProvider.notifier);
    final result = await notifier.build();
    expect(result, tPromoResponse);
  });

  test('should throw Failure on error', () async {
    when(() => mockUsecase()).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(getPromoProvider.notifier);
    expect(() => notifier.build(), throwsA(isA<Failure>()));
  });
}
