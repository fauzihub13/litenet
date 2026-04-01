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

  setUp(() {
    mockRepository = MockQuotaRepository();
    usecase = GetDetailQuotaUsecase(mockRepository);
  });

  test('should return DetailQuotaResponse on success', () async {
    final tDetailQuotaResponse = DetailQuotaResponse(
      success: true,
      message: 'ok',
      data: DetailQuotaDataEntity(
        id: "QUOTA-0000", // ID dummy
        code: "QCODE-0000", // kode dummy
        slug: "quota-dummy", // slug dummy
        name: "Paket Quota Dummy", // nama paket dummy
        quota: 0, // kuota kosong
        monthDuration: 0, // durasi kosong
        description: "Deskripsi dummy", // deskripsi dummy
        basePrice: 0, // harga dasar kosong
        promoPrice: 0, // harga promo kosong
        discount: 0, // diskon kosong
        capacity: "0GB", // kapasitas kosong
        isPromo: false, // status promo default
        terms: [], // list kosong
        devices: [], // list kosong
      ),
    );
    when(
      () => mockRepository.getDetailQuota(id: 'id1'),
    ).thenAnswer((_) async => Right(tDetailQuotaResponse));
    final result = await usecase(id: 'id1');
    expect(result, Right(tDetailQuotaResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.getDetailQuota(id: 'id1'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    final result = await usecase(id: 'id1');
    expect(result.isLeft(), true);
  });
}
