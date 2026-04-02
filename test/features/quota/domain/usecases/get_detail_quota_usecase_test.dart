import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockQuotaRepository extends Mock implements QuotaRepository {}

void main() {
  late MockQuotaRepository mockRepository;
  late GetDetailQuotaUsecase usecase;

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

  final tResponse = DetailQuotaResponse(
    success: true,
    message: 'Quota detail fetched successfully',
    data: tDetailQuotaData,
  );

  setUp(() {
    mockRepository = MockQuotaRepository();
    usecase = GetDetailQuotaUsecase(mockRepository);
  });

  group('GetDetailQuotaUsecase', () {
    test(
      'should call getDetailQuota from repository with correct id',
      () async {
        // arrange
        when(
          () => mockRepository.getDetailQuota(id: any(named: 'id')),
        ).thenAnswer((_) async => Right(tResponse));

        // act
        final result = await usecase(id: 'PLAN-001');

        // assert
        expect(result, Right(tResponse));
        verify(() => mockRepository.getDetailQuota(id: 'PLAN-001')).called(1);
      },
    );

    test(
      'should return Failure from repository when fetching detail fails',
      () async {
        // arrange
        final tFailure = Failure(message: 'Quota not found');
        when(
          () => mockRepository.getDetailQuota(id: any(named: 'id')),
        ).thenAnswer((_) async => Left(tFailure));

        // act
        final result = await usecase(id: 'PLAN-001');

        // assert
        expect(result, Left(tFailure));
      },
    );
  });
}
