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

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = GetPrivacyAndPolicyUsecase(mockRepository);
  });

  test('should return PrivacyAndPolicyResponse on success', () async {
    final tResponse = PrivacyAndPolicyResponse(
      success: true,
      message: 'ok',
      data: [],
    );
    when(
      () => mockRepository.getPrivacyAndPolicy(),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase();
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.getPrivacyAndPolicy(),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase();
    expect(result, Left(failure));
  });
}
