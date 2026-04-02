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
      overrides: [
        getFAQUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GetFAQProvider', () {
    test('should fetch FAQs and emit AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Right(tResponse));

      final listener = Listener<AsyncValue<FAQResponse>>();
      container.listen(
        getFAQProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      final state = await container.read(getFAQProvider.future);

      // assert
      expect(state, tResponse);
      verify(() => mockUsecase.call()).called(1);
      
      verifyInOrder([
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<FAQResponse>(tResponse)),
      ]);
    });

    test('should emit AsyncError when fetching fails', () async {
      // arrange
      when(() => mockUsecase.call()).thenAnswer((_) async => Left(tFailure));

      final listener = Listener<AsyncValue<FAQResponse>>();
      container.listen(
        getFAQProvider,
        listener.call,
        fireImmediately: true,
      );

      // act
      try {
        await container.read(getFAQProvider.future);
      } catch (e) {
        expect(e, tFailure);
      }

      // assert
      final finalState = container.read(getFAQProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
