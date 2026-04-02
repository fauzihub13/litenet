import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/quota/data/datasources/quota_datasource.dart';
import 'package:litenet/features/quota/data/repositories/quota_repository_impl.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:mocktail/mocktail.dart';

class MockQuotaDatasource extends Mock implements QuotaDatasource {}

void main() {
  late MockQuotaDatasource mockDatasource;
  late QuotaRepositoryImpl repository;

  final tQuotaData = QuotaDataEntity(
    id: "QUOTA-2026-APRIL",
    code: "QAPR26",
    slug: "paket-internet-hemat-april",
    name: "Paket Internet Hemat April",
    quota: 20,
    monthDuration: 1,
    description:
        "Paket internet hemat dengan kuota 20GB berlaku selama 1 bulan.",
    basePrice: 100000,
    promoPrice: 80000,
    discount: 20000,
    capacity: "20GB",
    isPromo: true,
    createdAt: DateTime(2026, 3, 25),
    updatedAt: DateTime(2026, 4, 1),
    deletedAt: null,
  );

  final tDetailQuotaData = DetailQuotaDataEntity(
    id: "QUOTA-2026-APRIL",
    code: "QAPR26",
    slug: "paket-internet-hemat-april",
    name: "Paket Internet Hemat April",
    quota: 20,
    monthDuration: 1,
    description:
        "Paket internet hemat dengan kuota 20GB berlaku selama 1 bulan.",
    basePrice: 100000,
    promoPrice: 80000,
    discount: 20000,
    capacity: "20GB",
    isPromo: true,
    terms: [],
    devices: [],
  );

  final tQuotaResponse = QuotaResponse(
    success: true,
    message: 'Success',
    data: [tQuotaData],
  );

  final tDetailQuotaResponse = DetailQuotaResponse(
    success: true,
    message: 'Success',
    data: tDetailQuotaData,
  );

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

  final tPromoResponse = CheckPromoResponse(
    success: true,
    message: 'Success',
    data: tPromoData,
  );

  setUp(() {
    mockDatasource = MockQuotaDatasource();
    repository = QuotaRepositoryImpl(quotaDatasource: mockDatasource);
  });

  group('QuotaRepositoryImpl', () {
    group('getAllQuotas', () {
      test(
        'should return QuotaResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getAllQuotas(),
          ).thenAnswer((_) async => tQuotaResponse);

          // act
          final result = await repository.getAllQuotas();

          // assert
          expect(result, Right(tQuotaResponse));
          verify(() => mockDatasource.getAllQuotas()).called(1);
        },
      );

      test('should return Failure when datasource throws', () async {
        // arrange
        when(
          () => mockDatasource.getAllQuotas(),
        ).thenThrow(Exception('Server error'));

        // act
        final result = await repository.getAllQuotas();

        // assert
        expect(result.isLeft(), true);
      });
    });

    group('getDetailQuota', () {
      test(
        'should return DetailQuotaResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getDetailQuota(id: any(named: 'id')),
          ).thenAnswer((_) async => tDetailQuotaResponse);

          // act
          final result = await repository.getDetailQuota(id: 'PLAN-001');

          // assert
          expect(result, Right(tDetailQuotaResponse));
          verify(() => mockDatasource.getDetailQuota(id: 'PLAN-001')).called(1);
        },
      );
    });

    group('checkPromoCode', () {
      test(
        'should return CheckPromoResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.checkPromoCode(
              dataPlanId: any(named: 'dataPlanId'),
              promoCode: any(named: 'promoCode'),
            ),
          ).thenAnswer((_) async => tPromoResponse);

          // act
          final result = await repository.checkPromoCode(
            dataPlanId: 'PLAN-001',
            promoCode: 'WELCOME2026',
          );

          // assert
          expect(result, Right(tPromoResponse));
          verify(
            () => mockDatasource.checkPromoCode(
              dataPlanId: 'PLAN-001',
              promoCode: 'WELCOME2026',
            ),
          ).called(1);
        },
      );
    });
  });
}
