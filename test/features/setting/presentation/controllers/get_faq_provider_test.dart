import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/usecases/get_faq_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/get_faq_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetFAQUsecase extends Mock implements GetFAQUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGetFAQUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetFAQUsecase();
    container = ProviderContainer(
      overrides: [getFAQUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  test('should return FAQResponse on success', () async {
    final tResponse = FAQResponse(
      success: true,
      message: 'ok',
      data: [
        FAQDataEntity(
          id: '1',
          slug: 'faq-1',
          title: 'FAQ 1',
          description: 'desc',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
        ),
      ],
    );
    when(() => mockUsecase()).thenAnswer((_) async => Right(tResponse));
    final result = await container.read(getFAQProvider.future);
    expect(result, tResponse);
  });

  test('should throw StateError on error', () async {
    when(
      () => mockUsecase(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    expect(
      () => container.read(getFAQProvider.future),
      throwsA(isA<StateError>()),
    );
  });
}
