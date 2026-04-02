// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:litenet/core/errors/failure.dart';
// import 'package:litenet/features/auth/data/di/usecase_provider.dart';
// import 'package:litenet/features/auth/domain/entities/summary.dart';
// import 'package:litenet/features/auth/domain/usecases/get_summary_usecase.dart';
// import 'package:litenet/features/auth/presentation/controllers/get_summary_provider.dart';
// import 'package:mocktail/mocktail.dart';

// class MockGetSummaryUsecase extends Mock implements GetSummaryUsecase {}

// class Listener<T> extends Mock {
//   void call(T? previous, T next);
// }

// void main() {
//   late MockGetSummaryUsecase mockGetSummaryUsecase;
//   late ProviderContainer container;

//   final tSummaryResponse = SummaryResponse(
//     success: true,
//     message: 'Summary fetched successfully',
//     data: SummaryDataEntity(
//       totalDevice: 10,
//       onlineDevice: 7,
//       offlineDevice: 2,
//       inactiveDevice: 1,
//     ),
//   );

//   final tFailure = Failure(message: 'Failed to fetch summary');

//   setUpAll(() {
//     registerFallbackValue(const AsyncLoading<SummaryResponse>());
//     registerFallbackValue(AsyncData<SummaryResponse>(tSummaryResponse));
//   });

//   setUp(() {
//     mockGetSummaryUsecase = MockGetSummaryUsecase();
//     container = ProviderContainer(
//       overrides: [
//         getSummaryUsecaseProvider.overrideWithValue(mockGetSummaryUsecase),
//       ],
//     );
//   });

//   tearDown(() {
//     container.dispose();
//   });

//   group('GetSummaryProvider', () {
//     test('should fetch summary and emit AsyncData on success', () async {
//       // arrange
//       when(
//         () => mockGetSummaryUsecase.call(),
//       ).thenAnswer((_) async => Right(tSummaryResponse));

//       final listener = Listener<AsyncValue<SummaryResponse>>();
//       container.listen(
//         getSummaryProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // act
//       final state = await container.read(getSummaryProvider.future);

//       // assert
//       expect(state, tSummaryResponse);
//       verify(() => mockGetSummaryUsecase.call()).called(1);

//       verifyInOrder([
//         () => listener(any(), any(that: isA<AsyncLoading>())),
//         () => listener(any(), AsyncData<SummaryResponse>(tSummaryResponse)),
//       ]);
//     });

//     test('should emit AsyncError when usecase fails', () async {
//       // Arrange
//       when(
//         () => mockGetSummaryUsecase.call(),
//       ).thenAnswer((_) async => Left(tFailure));

//       final container = ProviderContainer(
//         overrides: [
//           getSummaryUsecaseProvider.overrideWithValue(mockGetSummaryUsecase),
//         ],
//       );

//       final listener = Listener<AsyncValue<SummaryResponse>>();
//       container.listen(
//         getSummaryProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // Act
//       try {
//         await container.read(getSummaryProvider.future);
//       } catch (_) {}

//       // Assert
//       final finalState = container.read(getSummaryProvider);
//       expect(finalState, isA<AsyncError<SummaryResponse>>());
//       expect(finalState.error, equals(tFailure));

//       // verifyInOrder([
//       //   () =>
//       //       listener.call(null, argThat(isA<AsyncLoading<SummaryResponse>>())),
//       //   () => listener.call(
//       //     argThat(isA<AsyncLoading<SummaryResponse>>()),
//       //     argThat(isA<AsyncError<SummaryResponse>>()),
//       //   ),
//       // ]);

//       verify(() => mockGetSummaryUsecase.call()).called(1);
//       verifyNoMoreInteractions(mockGetSummaryUsecase);
//       container.dispose();
//     });
//   });
// }

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/get_detail_quota_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

// ======================
// MOCK
// ======================

class MockGetDetailQuotaUsecase extends Mock implements GetDetailQuotaUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetDetailQuotaUsecase mockUsecase;
  late ProviderContainer container;

  final tDetailQuotaData = DetailQuotaDataEntity(
    id: "QUOTA-2026-APRIL",
    code: "QAPR26",
    slug: "paket-internet-hemat-april",
    name: "Paket Internet Hemat April",
    quota: 20,
    monthDuration: 1,
    description:
        "Paket internet hemat dengan kuota 20GB berlaku selama 1 bulan.",
    basePrice: 100000,
    promoPrice: 80000,
    discount: 20000,
    capacity: "20GB",
    isPromo: true,
    terms: [],
    devices: [],
  );

  final tDetailQuotaResponse = DetailQuotaResponse(
    success: true,
    message: 'Success',
    data: tDetailQuotaData,
  );

  final tFailure = Failure(message: 'Quota not found');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<DetailQuotaResponse>());
    registerFallbackValue(AsyncData<DetailQuotaResponse>(tDetailQuotaResponse));
  });

  setUp(() {
    mockUsecase = MockGetDetailQuotaUsecase();

    container = ProviderContainer(
      overrides: [getDetailQuotaUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  // ======================
  // TEST
  // ======================

  group('GetDetailQuotaProvider', () {
    test('should emit AsyncData on success', () async {
      // arrange
      when(
        () => mockUsecase.call(id: any(named: 'id')),
      ).thenAnswer((_) async => Right(tDetailQuotaResponse));

      final listener = Listener<AsyncValue<DetailQuotaResponse>>();

      final completer = Completer<DetailQuotaResponse>();

      final sub = container.listen(getDetailQuotaProvider(id: 'PLAN-001'), (
        prev,
        next,
      ) {
        listener.call(prev, next);

        next.whenData((data) {
          if (!completer.isCompleted) {
            completer.complete(data);
          }
        });
      }, fireImmediately: true);

      // act
      final result = await completer.future;

      // assert
      expect(result, tDetailQuotaResponse);

      verify(() => mockUsecase.call(id: 'PLAN-001')).called(1);

      verifyInOrder([
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(
          any(),
          AsyncData<DetailQuotaResponse>(tDetailQuotaResponse),
        ),
      ]);

      sub.close();
    });

    test('should throw Failure when failed', () async {
      // arrange
      when(
        () => mockUsecase.call(id: any(named: 'id')),
      ).thenAnswer((_) async => Left(tFailure));

      final provider = getDetailQuotaProvider(id: 'PLAN-001');

      // 🔥 WAJIB → tahan provider supaya tidak dispose
      final sub = container.listen(provider, (_, __) {}, fireImmediately: true);

      // act
      Object? error;
      try {
        await container.read(provider.future);
      } catch (e) {
        error = e;
      }

      // assert
      expect(error, tFailure);
      verify(() => mockUsecase.call(id: 'PLAN-001')).called(1);

      sub.close();
    });
  });
}
