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

  setUp(() {
    mockRepository = MockQuotaRepository();
    usecase = CheckPromoUsecase(mockRepository);
  });

  test('should return CheckPromoResponse on success', () async {
    final tCheckPromoResponse = CheckPromoResponse(
      success: true,
      message: 'ok',
      data: PromoDataEntity(
        id: "PROMO-0000", // ID dummy
        slug: "promo-dummy", // slug dummy
        title: "Promo Dummy", // judul dummy
        minimumTransaction: 0, // transaksi minimal kosong
        maxDiscount: 0, // diskon maksimal kosong
        promoCode: "DUMMYCODE", // kode promo dummy
        startAt: DateTime.now(), // mulai sekarang
        endAt: DateTime.now().add(
          const Duration(days: 7),
        ), // berakhir 7 hari dari sekarang
        isActive: false, // status tidak aktif
        createdAt: DateTime.now(), // waktu dibuat sekarang
        updatedAt: DateTime.now(), // waktu update sekarang
        deletedAt: null, // belum dihapus
      )
    );
    when(
      () => mockRepository.checkPromoCode(
        dataPlanId: 'plan1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => Right(tCheckPromoResponse));
    final result = await usecase(dataPlanId: 'plan1', promoCode: 'PROMO');
    expect(result, Right(tCheckPromoResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.checkPromoCode(
        dataPlanId: 'plan1',
        promoCode: 'PROMO',
      ),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    final result = await usecase(dataPlanId: 'plan1', promoCode: 'PROMO');
    expect(result.isLeft(), true);
  });
}
