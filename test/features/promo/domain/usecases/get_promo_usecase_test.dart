import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/domain/repositories/promo_repository.dart';
import 'package:litenet/features/promo/domain/usecases/get_promo_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockPromoRepository extends Mock implements PromoRepository {}

void main() {
  late MockPromoRepository mockRepository;
  late GetPromoUsecase usecase;

  setUp(() {
    mockRepository = MockPromoRepository();
    usecase = GetPromoUsecase(mockRepository);
  });

  test('should return PromoResponse on success', () async {
    final tPromoResponse = PromoResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(
      () => mockRepository.getPromo(),
    ).thenAnswer((_) async => Right(tPromoResponse));

    final result = await usecase();
    expect(result, Right(tPromoResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.getPromo(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final result = await usecase();
    expect(result.isLeft(), true);
  });
}
