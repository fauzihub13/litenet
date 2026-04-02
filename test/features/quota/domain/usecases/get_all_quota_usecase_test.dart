import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';
import 'package:litenet/features/quota/domain/usecases/get_all_quota_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockQuotaRepository extends Mock implements QuotaRepository {}

void main() {
  late MockQuotaRepository mockRepository;
  late GetAllQuotaUsecase usecase;

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

  final tResponse = QuotaResponse(
    success: true,
    message: 'Quotas fetched successfully',
    data: [tQuotaData],
  );

  setUp(() {
    mockRepository = MockQuotaRepository();
    usecase = GetAllQuotaUsecase(mockRepository);
  });

  group('GetAllQuotaUsecase', () {
    test('should call getAllQuota from repository', () async {
      // arrange
      when(
        () => mockRepository.getAllQuotas(),
      ).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getAllQuotas()).called(1);
    });

    test('should return Failure from repository when fetching fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch quotas');
      when(
        () => mockRepository.getAllQuotas(),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
