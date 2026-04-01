import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
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

  setUp(() {
    mockDatasource = MockQuotaDatasource();
    repository = QuotaRepositoryImpl(quotaDatasource: mockDatasource);
  });

  group('getAllQuotas', () {
    test(
      'should return QuotaResponse when datasource returns success',
      () async {
        final tQuotaResponse = QuotaResponse(
          success: true,
          message: 'ok',
          data: [],
        );
        when(
          () => mockDatasource.getAllQuotas(),
        ).thenAnswer((_) async => tQuotaResponse);
        final result = await repository.getAllQuotas();
        expect(result, Right(tQuotaResponse));
        verify(() => mockDatasource.getAllQuotas()).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(() => mockDatasource.getAllQuotas()).thenThrow(Exception('error'));
      final result = await repository.getAllQuotas();
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getAllQuotas()).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = QuotaResponse(
        success: false,
        message: 'Failed',
        data: [],
      );
      when(
        () => mockDatasource.getAllQuotas(),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.getAllQuotas();
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(() => mockDatasource.getAllQuotas()).called(1);
    });
  });

  group('getDetailQuota', () {
    test(
      'should return DetailQuotaResponse when datasource returns success',
      () async {
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
          () => mockDatasource.getDetailQuota(id: 'id1'),
        ).thenAnswer((_) async => tDetailQuotaResponse);
        final result = await repository.getDetailQuota(id: 'id1');
        expect(result, Right(tDetailQuotaResponse));
        verify(() => mockDatasource.getDetailQuota(id: 'id1')).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.getDetailQuota(id: 'id1'),
      ).thenThrow(Exception('error'));
      final result = await repository.getDetailQuota(id: 'id1');
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getDetailQuota(id: 'id1')).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = DetailQuotaResponse(
        success: false,
        message: 'Failed',
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
        () => mockDatasource.getDetailQuota(id: 'id1'),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.getDetailQuota(id: 'id1');
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(() => mockDatasource.getDetailQuota(id: 'id1')).called(1);
    });
  });

  group('checkPromoCode', () {
    test(
      'should return CheckPromoResponse when datasource returns success',
      () async {
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
          ),
        );
        when(
          () => mockDatasource.checkPromoCode(
            dataPlanId: 'plan1',
            promoCode: 'PROMO',
          ),
        ).thenAnswer((_) async => tCheckPromoResponse);
        final result = await repository.checkPromoCode(
          dataPlanId: 'plan1',
          promoCode: 'PROMO',
        );
        expect(result, Right(tCheckPromoResponse));
        verify(
          () => mockDatasource.checkPromoCode(
            dataPlanId: 'plan1',
            promoCode: 'PROMO',
          ),
        ).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.checkPromoCode(
          dataPlanId: 'plan1',
          promoCode: 'PROMO',
        ),
      ).thenThrow(Exception('error'));
      final result = await repository.checkPromoCode(
        dataPlanId: 'plan1',
        promoCode: 'PROMO',
      );
      expect(result.isLeft(), true);
      verify(
        () => mockDatasource.checkPromoCode(
          dataPlanId: 'plan1',
          promoCode: 'PROMO',
        ),
      ).called(1);
    });

    test('should return Failure when datasource returns !success', () async {
      final tFailResponse = CheckPromoResponse(
        success: false,
        message: 'Failed',
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
        ),
      );
      when(
        () => mockDatasource.checkPromoCode(
          dataPlanId: 'plan1',
          promoCode: 'PROMO',
        ),
      ).thenAnswer((_) async => tFailResponse);
      final result = await repository.checkPromoCode(
        dataPlanId: 'plan1',
        promoCode: 'PROMO',
      );
      result.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, 'Failed');
      }, (_) => fail('Should not be success'));
      verify(
        () => mockDatasource.checkPromoCode(
          dataPlanId: 'plan1',
          promoCode: 'PROMO',
        ),
      ).called(1);
    });
  });
}
