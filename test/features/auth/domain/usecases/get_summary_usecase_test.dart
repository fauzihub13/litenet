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

  final tSummaryResponse = SummaryResponse(
    success: true,
    message: 'Summary fetched successfully',
    data: SummaryDataEntity(
      totalDevice: 10,
      onlineDevice: 7,
      offlineDevice: 2,
      inactiveDevice: 1,
    ),
  );

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = GetSummaryUsecase(mockRepository);
  });

  group('GetSummaryUsecase', () {
    test('should call getSummary from repository', () async {
      // arrange
      when(() => mockRepository.getSummary())
          .thenAnswer((_) async => Right(tSummaryResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tSummaryResponse));
      verify(() => mockRepository.getSummary()).called(1);
    });

    test('should return Failure from repository when fetching summary fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch summary');
      when(() => mockRepository.getSummary())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
      verify(() => mockRepository.getSummary()).called(1);
    });
  });
}
