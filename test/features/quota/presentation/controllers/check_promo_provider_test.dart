import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/usecases/check_promo_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/check_promo_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCheckPromoUsecase extends Mock implements CheckPromoUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCheckPromoUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockCheckPromoUsecase();
    container = ProviderContainer(
      overrides: [checkPromoUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  test('should emit loading and then data on success', () async {
    final tResponse = CheckPromoResponse(
      success: true,
      message: 'ok',
      data: PromoDataEntity(
        id: "PROMO-${DateTime.now().millisecondsSinceEpoch}", // ID unik dummy
        slug: "promo-dummy", // slug kosong
        title: "Promo Dummy", // judul dummy
        minimumTransaction: 0, // nilai minimal transaksi kosong
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
      () => mockUsecase(dataPlanId: 'Q-1', promoCode: 'PROMO'),
    ).thenAnswer((_) async => Right(tResponse));
    final notifier = container.read(checkPromoProvider.notifier);
    final future = notifier.checkPromoCode(
      dataPlanId: 'Q-1',
      promoCode: 'PROMO',
    );
    expect(container.read(checkPromoProvider), isA<AsyncLoading>());
    await future;
    CheckPromoResponse? value;
    for (var i = 0; i < 100; i++) {
      final state = container.read(checkPromoProvider);
      if (!state.isLoading) {
        value = state.value;
        break;
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    expect(value, isNotNull);
    expect(value, tResponse);
  });

  test('should emit loading and then error on failure', () async {
    when(
      () => mockUsecase(dataPlanId: 'Q-1', promoCode: 'PROMO'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    final notifier = container.read(checkPromoProvider.notifier);
    final future = notifier.checkPromoCode(
      dataPlanId: 'Q-1',
      promoCode: 'PROMO',
    );
    expect(container.read(checkPromoProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(checkPromoProvider).hasError, true);
  });
}
