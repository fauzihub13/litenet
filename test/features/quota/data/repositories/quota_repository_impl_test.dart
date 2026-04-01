import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/datasources/quota_datasource.dart';
import 'package:litenet/features/quota/data/repositories/quota_repository_impl.dart';
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

  test('should return QuotaResponse when datasource returns success', () async {
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
  });

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
}
