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

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetFAQUsecase mockUsecase;
  late ProviderContainer container;

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

  final tFailure = Failure(message: 'Failed to fetch FAQs');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<FAQResponse>());
    registerFallbackValue(AsyncData<FAQResponse>(tResponse));
  });

  setUp(() {
    mockUsecase = MockGetFAQUsecase();
    container = ProviderContainer(
      overrides: [getFAQUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetFAQProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getFAQProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      // Wait for build to finish
      await container.read(getFAQProvider.future);

      final listener = Listener<AsyncValue<FAQResponse?>>();
      container.listen(getFAQProvider, listener.call, fireImmediately: true);

      final notifier = container.read(getFAQProvider.notifier);

      // act
      await notifier.fetchFAQ();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<FAQResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<FAQResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call()).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getFAQProvider.future);

      final listener = Listener<AsyncValue<FAQResponse?>>();
      container.listen(getFAQProvider, listener.call, fireImmediately: true);

      final notifier = container.read(getFAQProvider.notifier);

      // act
      await notifier.fetchFAQ();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<FAQResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getFAQProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
