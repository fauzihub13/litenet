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
    message: 'Promos fetched successfully',
    data: [tPromoData],
  );

  setUp(() {
    mockRepository = MockPromoRepository();
    usecase = GetPromoUsecase(mockRepository);
  });

  group('GetPromoUsecase', () {
    test('should call getPromo from repository', () async {
      // arrange
      when(() => mockRepository.getPromo())
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getPromo()).called(1);
    });

    test('should return Failure from repository when fetching fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch promos');
      when(() => mockRepository.getPromo())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
