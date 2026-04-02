import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';
import 'package:litenet/features/quota/domain/usecases/check_promo_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockQuotaRepository extends Mock implements QuotaRepository {}

void main() {
  late MockQuotaRepository mockRepository;
  late CheckPromoUsecase usecase;

  final tPromoData = PromoDataEntity(
    id: "PROMO-APRIL-2026",
    slug: "internet-super-hemat-april",
    title: "Promo Internet Super Hemat April",
    minimumTransaction: 75000,
    maxDiscount: 25000,
    promoCode: "SUPERHEMAT26",
    startAt: DateTime(2026, 4, 1),
    endAt: DateTime(2026, 4, 30),
    isActive: true,
    createdAt: DateTime(2026, 3, 28),
    updatedAt: DateTime(2026, 4, 1),
    deletedAt: null,
  );

  final tResponse = CheckPromoResponse(
    success: true,
    message: 'Promo code is valid',
    data: tPromoData,
  );

  setUp(() {
    mockRepository = MockQuotaRepository();
    usecase = CheckPromoUsecase(mockRepository);
  });

  group('CheckPromoUsecase', () {
    test('should call checkPromo from repository with correct code', () async {
      // arrange
      when(
        () => mockRepository.checkPromoCode(
          promoCode: any(named: 'promoCode'),
          dataPlanId: any(named: 'dataPlanId'),
        ),
      ).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(
        promoCode: 'WELCOME2026',
        dataPlanId: 'PLAN-001',
      );

      // assert
      expect(result, Right(tResponse));
      verify(
        () => mockRepository.checkPromoCode(
          promoCode: 'WELCOME2026',
          dataPlanId: 'PLAN-001',
        ),
      ).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Invalid promo code');
      when(
        () => mockRepository.checkPromoCode(
          promoCode: any(named: 'promoCode'),
          dataPlanId: any(named: 'dataPlanId'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(
        promoCode: 'INVALID',
        dataPlanId: 'PLAN-001',
      );

      // assert
      expect(result, Left(tFailure));
    });
  });
}
