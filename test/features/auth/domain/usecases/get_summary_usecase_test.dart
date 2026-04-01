import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';
import 'package:litenet/features/auth/domain/usecases/get_summary_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late GetSummaryUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = GetSummaryUsecase(mockRepository);
  });

  test('should return SummaryResponse on success', () async {
    final tSummaryResponse = SummaryResponse(
      success: true,
      message: 'ok',
      data: SummaryDataEntity(
        totalDevice: 0, 
        onlineDevice: 0, 
        offlineDevice: 0, 
        inactiveDevice: 0, 
      ),
    );
    when(
      () => mockRepository.getSummary(),
    ).thenAnswer((_) async => Right(tSummaryResponse));
    final result = await usecase();
    expect(result, Right(tSummaryResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.getSummary(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    final result = await usecase();
    expect(result.isLeft(), true);
  });
}
