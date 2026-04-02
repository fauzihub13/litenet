import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/get_privacy_and_policy_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late GetPrivacyAndPolicyUsecase usecase;

  final tPrivacyPolicy = PrivacyAndPolicyDataEntity(
    id: 'PP-001',
    slug: 'privacy-policy',
    title: 'Privacy Policy',
    description: 'Detailed privacy policy content...',
    createdAt: DateTime(2026, 4, 2, 10, 0, 0),
    updatedAt: DateTime(2026, 4, 2, 10, 0, 0),
    deletedAt: null,
  );

  final tResponse = PrivacyAndPolicyResponse(
    success: true,
    message: 'Privacy policy fetched successfully',
    data: [tPrivacyPolicy],
  );

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = GetPrivacyAndPolicyUsecase(mockRepository);
  });

  group('GetPrivacyAndPolicyUsecase', () {
    test('should call getPrivacyAndPolicy from repository', () async {
      // arrange
      when(() => mockRepository.getPrivacyAndPolicy())
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.getPrivacyAndPolicy()).called(1);
    });

    test('should return Failure from repository when fetching fails', () async {
      // arrange
      final tFailure = Failure(message: 'Failed to fetch privacy policy');
      when(() => mockRepository.getPrivacyAndPolicy())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
