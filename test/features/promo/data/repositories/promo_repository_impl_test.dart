import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/data/datasources/promo_datasource.dart';
import 'package:litenet/features/promo/data/repositories/promo_repository_impl.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:mocktail/mocktail.dart';

class MockPromoDatasource extends Mock implements PromoDatasource {}

void main() {
  late MockPromoDatasource mockDatasource;
  late PromoRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockPromoDatasource();
    repository = PromoRepositoryImpl(promoDatasource: mockDatasource);
  });

  test('should return PromoResponse when datasource returns success', () async {
    final tPromoResponse = PromoResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(
      () => mockDatasource.getPromo(),
    ).thenAnswer((_) async => tPromoResponse);

    final result = await repository.getPromo();
    expect(result, Right(tPromoResponse));
    verify(() => mockDatasource.getPromo()).called(1);
  });

  test('should return Failure when datasource throws', () async {
    when(() => mockDatasource.getPromo()).thenThrow(Exception('error'));

    final result = await repository.getPromo();
    expect(result.isLeft(), true);
    verify(() => mockDatasource.getPromo()).called(1);
  });

  test('should return Failure when datasource returns !success', () async {
    final tFailResponse = PromoResponse(
      success: false,
      message: 'Failed',
      data: [],
    );
    when(
      () => mockDatasource.getPromo(),
    ).thenAnswer((_) async => tFailResponse);

    final result = await repository.getPromo();
    result.fold((failure) {
      expect(failure, isA<Failure>());
      expect(failure.message, 'Failed');
    }, (_) => fail('Should not be success'));
    verify(() => mockDatasource.getPromo()).called(1);
  });
}
