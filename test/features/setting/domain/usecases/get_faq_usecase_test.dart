import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/get_faq_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late GetFAQUsecase usecase;

  final tFAQ = FAQDataEntity(
    id: 'FAQ-001',
    slug: 'how-to-buy-quota',
    title: 'How to buy quota?',
    description: 'Go to Home and select Quota menu.',
    createdAt: DateTime(2026, 4, 2, 10, 0, 0),
    updatedAt: DateTime(2026, 4, 2, 10, 0, 0),
    deletedAt: null,
  );

  final tResponse = FAQResponse(
    success: true,
    message: 'FAQs fetched successfully',
    data: [tFAQ],
  );

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = GetFAQUsecase(mockRepository);
  });

  group('GetFAQUsecase', () {
    test('should call getFAQ from repository', () async {
      // arrange
      when(() => mockRepository.getFAQ())
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getFAQ()).called(1);
    });

    test('should return Failure from repository when fetching FAQs fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch FAQs');
      when(() => mockRepository.getFAQ())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
