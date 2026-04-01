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

  setUp(() {
    mockRepository = MockQuotaRepository();
    usecase = GetAllQuotaUsecase(mockRepository);
  });

  test('should return QuotaResponse on success', () async {
    final tQuotaResponse = QuotaResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(
      () => mockRepository.getAllQuotas(),
    ).thenAnswer((_) async => Right(tQuotaResponse));

    final result = await usecase();
    expect(result, Right(tQuotaResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.getAllQuotas(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final result = await usecase();
    expect(result.isLeft(), true);
  });
}
