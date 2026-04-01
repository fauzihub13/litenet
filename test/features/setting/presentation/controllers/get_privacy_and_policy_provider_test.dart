import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/usecases/get_privacy_and_policy_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/get_privacy_and_policy_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPrivacyAndPolicyUsecase extends Mock
    implements GetPrivacyAndPolicyUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGetPrivacyAndPolicyUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetPrivacyAndPolicyUsecase();
    container = ProviderContainer(
      overrides: [
        getPrivacyAndPolicyUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should return PrivacyAndPolicyResponse on success', () async {
    final tResponse = PrivacyAndPolicyResponse(
      success: true,
      message: 'ok',
      data: [
        PrivacyAndPolicyDataEntity(
          id: '1',
          slug: 'privacy-1',
          title: 'Privacy 1',
          description: 'desc',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
        ),
      ],
    );
    when(() => mockUsecase()).thenAnswer((_) async => Right(tResponse));
    final result = await container.read(getPrivacyAndPolicyProvider.future);
    expect(result, tResponse);
  });

  test('should throw StateError on error', () async {
    when(
      () => mockUsecase(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    expect(
      () => container.read(getPrivacyAndPolicyProvider.future),
      throwsA(isA<StateError>()),
    );
  });
}
