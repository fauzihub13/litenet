import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/domain/usecases/get_all_quota_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/get_all_quota_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllQuotaUsecase extends Mock implements GetAllQuotaUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetAllQuotaUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetAllQuotaUsecase();
    container = ProviderContainer(
      overrides: [
        getAllQuotasUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  test('should return QuotaResponse on success', () async {
    final tQuotaResponse = QuotaResponse(success: true, message: 'ok', data: []);
    when(() => mockUsecase()).thenAnswer((_) async => Right(tQuotaResponse));

    final notifier = container.read(getAllQuotaProvider.notifier);
    final result = await notifier.build();
    expect(result, tQuotaResponse);
  });

  test('should throw Failure on error', () async {
    when(() => mockUsecase()).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(getAllQuotaProvider.notifier);
    expect(() => notifier.build(), throwsA(isA<Failure>()));
  });
}
