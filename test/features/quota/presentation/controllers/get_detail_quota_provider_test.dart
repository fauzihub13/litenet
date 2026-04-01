import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/get_detail_quota_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDetailQuotaUsecase extends Mock implements GetDetailQuotaUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetDetailQuotaUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetDetailQuotaUsecase();
    container = ProviderContainer(
      overrides: [getDetailQuotaUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  test('should return DetailQuotaResponse on success', () async {
    final tResponse = DetailQuotaResponse(
      success: true,
      message: 'ok',
      data: DetailQuotaDataEntity(
        id: 'Q-1',
        code: 'QCODE',
        slug: 'qslug',
        name: 'Quota Name',
        quota: 10,
        monthDuration: 1,
        description: 'desc',
        basePrice: 10000,
        promoPrice: 9000,
        discount: 1000,
        capacity: '10GB',
        isPromo: true,
        terms: ['term1', 'term2'],
        devices: const [],
      ),
    );
    when(
      () => mockUsecase(id: 'Q-1'),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await container.read(
      getDetailQuotaProvider(id: 'Q-1').future,
    );
    expect(result, tResponse);
  });

  test(
    'should throw StateError on error (provider disposed before emitting value)',
    () async {
      when(
        () => mockUsecase(id: 'Q-1'),
      ).thenAnswer((_) async => Left(Failure(message: 'error')));
      expect(
        () => container.read(getDetailQuotaProvider(id: 'Q-1').future),
        throwsA(isA<StateError>()),
      );
    },
  );
}
