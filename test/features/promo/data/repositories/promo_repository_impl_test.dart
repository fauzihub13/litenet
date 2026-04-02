import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/promo/data/datasources/promo_datasource.dart';
import 'package:litenet/features/promo/data/repositories/promo_repository_impl.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:mocktail/mocktail.dart';

class MockPromoDatasource extends Mock implements PromoDatasource {}

void main() {
  late MockPromoDatasource mockDatasource;
  late PromoRepositoryImpl repository;

  final tPromoData = PromoDataEntity(
    id: "PROMO-2026-APRIL",
    slug: "internet-hemat-april",
    title: "Promo Internet Hemat April",
    minimumTransaction: 50000,
    maxDiscount: 20000,
    promoCode: "HEMATAPRIL26",
    startAt: DateTime(2026, 4, 1),
    endAt: DateTime(2026, 4, 30),
    isActive: true,
    createdAt: DateTime(2026, 3, 25),
    updatedAt: DateTime(2026, 4, 1),
    deletedAt: null,
  );

  final tResponse = PromoResponse(
    success: true,
    message: 'Success',
    data: [tPromoData],
  );

  setUp(() {
    mockDatasource = MockPromoDatasource();
    repository = PromoRepositoryImpl(promoDatasource: mockDatasource);
  });

  group('PromoRepositoryImpl', () {
    test(
      'should return PromoResponse when datasource returns success',
      () async {
        // arrange
        when(
          () => mockDatasource.getPromo(),
        ).thenAnswer((_) async => tResponse);

        // act
        final result = await repository.getPromo();

        // assert
        expect(result, Right(tResponse));
        verify(() => mockDatasource.getPromo()).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      // arrange
      when(
        () => mockDatasource.getPromo(),
      ).thenThrow(Exception('Server error'));

      // act
      final result = await repository.getPromo();

      // assert
      expect(result.isLeft(), true);
    });
  });
}
