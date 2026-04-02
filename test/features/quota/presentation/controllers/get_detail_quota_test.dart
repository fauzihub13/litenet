// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:litenet/core/errors/failure.dart';
// import 'package:litenet/features/quota/data/di/usecase_provider.dart';
// import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
// import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
// import 'package:litenet/features/quota/presentation/controllers/get_detail_quota_provider.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:riverpod/riverpod.dart';

// class MockGetDetailQuotaUsecase extends Mock implements GetDetailQuotaUsecase {}

// class Listener<T> extends Mock {
//   void call(T? previous, T next);
// }

// void main() {
//   late MockGetDetailQuotaUsecase mockUsecase;
//   late ProviderContainer container;

//   // Data Dummy Entity
//   final tDetailQuotaEntity = DetailQuotaDataEntity(
//     id: "QUOTA-2026-APRIL",
//     code: "QAPR26",
//     slug: "paket-internet-hemat-april",
//     name: "Paket Internet Hemat April",
//     quota: 20,
//     monthDuration: 1,
//     description: "Paket internet hemat dengan kuota 20GB.",
//     basePrice: 100000,
//     promoPrice: 80000,
//     discount: 20000,
//     capacity: "20GB",
//     isPromo: true,
//     terms: [],
//     devices: [],
//   );

//   final tDetailQuotaResponse = DetailQuotaResponse(
//     success: true,
//     message: 'Success',
//     data: tDetailQuotaEntity,
//   );

//   final tFailure = Failure(message: 'Quota not found');

//   setUpAll(() {
//     registerFallbackValue(tDetailQuotaResponse);
//   });

//   setUp(() {
//     mockUsecase = MockGetDetailQuotaUsecase();

//     container = ProviderContainer(
//       overrides: [getDetailQuotaUsecaseProvider.overrideWithValue(mockUsecase)],
//     );
//   });

//   tearDown(() {
//     container.dispose();
//   });

//   group('GetDetailQuotaProvider - Unit Test', () {
//     test('should return DetailQuotaResponse when usecase succeeds', () async {
//       // Arrange
//       when(
//         () => mockUsecase.call(id: any(named: 'id')),
//       ).thenAnswer((_) async => Right(tDetailQuotaResponse));

//       // Act
//       // Akses .future untuk mendapatkan hasil async dari Riverpod generator
//       final result = await container.read(
//         getDetailQuotaProvider(id: 'PLAN-001').future,
//       );

//       // Assert
//       expect(result, equals(tDetailQuotaResponse));
//       verify(() => mockUsecase.call(id: 'PLAN-001')).called(1);
//       verifyNoMoreInteractions(mockUsecase);
//     });

//     test('should emit AsyncError when fetching fails', () async {
//       // arrange
//       when(
//         () => mockUsecase.call(id: any(named: 'id')),
//       ).thenAnswer((_) async => Left(tFailure));

//       final listener = Listener<AsyncValue<DetailQuotaResponse>>();

//       container.listen(
//         getDetailQuotaProvider(id: 'PLAN-001'),
//         listener.call,
//         fireImmediately: true,
//       );

//       // act
//       await container
//           .read(getDetailQuotaProvider(id: 'PLAN-001').future)
//           .catchError((_) => tDetailQuotaResponse);

//       // assert
//        final finalState = container.read(getDetailQuotaProvider(id: 'PLAN-001'));
//       expect(finalState, isA<AsyncError<DetailQuotaResponse>>());
//       expect(finalState.error, equals(tFailure));
//     });
//   });
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/usecases/get_detail_quota_usecase.dart';
import 'package:litenet/features/quota/presentation/controllers/get_detail_quota_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

class MockGetDetailQuotaUsecase extends Mock implements GetDetailQuotaUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetDetailQuotaUsecase mockUsecase;

  final tDetailQuotaEntity = DetailQuotaDataEntity(
    id: "QUOTA-2026-APRIL",
    code: "QAPR26",
    slug: "paket-internet-hemat-april",
    name: "Paket Internet Hemat April",
    quota: 20,
    monthDuration: 1,
    description: "Paket internet hemat dengan kuota 20GB.",
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
    data: tDetailQuotaEntity,
  );

  final tFailure = Failure(message: 'Quota not found');

  setUpAll(() {
    registerFallbackValue(tDetailQuotaResponse);
  });

  setUp(() {
    mockUsecase = MockGetDetailQuotaUsecase();
  });

  ProviderContainer makeContainer() {
    final container = ProviderContainer(
      overrides: [getDetailQuotaUsecaseProvider.overrideWithValue(mockUsecase)],
    );
    // addTearDown(container.dispose);
    return container;
  }

  group('GetDetailQuotaProvider - Unit Test', () {
    // ----------------------------------------------------------------
    // KONDISI SUKSES
    // ----------------------------------------------------------------
    test('should return DetailQuotaResponse when usecase succeeds', () async {
      // Arrange
      when(
        () => mockUsecase.call(id: any(named: 'id')),
      ).thenAnswer((_) async => Right(tDetailQuotaResponse));

      final container = makeContainer();
      final listener = Listener<AsyncValue<DetailQuotaResponse>>();

      container.listen(
        getDetailQuotaProvider(id: 'PLAN-001'),
        listener.call,
        fireImmediately: true,
      );

      // Act
      // Provider melempar Right(data) → fold → return data langsung
      final result = await container.read(
        getDetailQuotaProvider(id: 'PLAN-001').future,
      );

      // Assert
      expect(result, equals(tDetailQuotaResponse));

      final state = container.read(getDetailQuotaProvider(id: 'PLAN-001'));
      expect(state, isA<AsyncData<DetailQuotaResponse>>());
      expect(state.value, equals(tDetailQuotaResponse));

      verify(() => mockUsecase.call(id: 'PLAN-001')).called(1);
      verifyNoMoreInteractions(mockUsecase);
    });

    // ----------------------------------------------------------------
    // KONDISI GAGAL
    // ----------------------------------------------------------------
    test('should emit AsyncError when usecase fails', () async {
      // Arrange
      when(
        () => mockUsecase.call(id: any(named: 'id')),
      ).thenAnswer((_) async => Left(tFailure));

      final container = makeContainer();
      final listener = Listener<AsyncValue<DetailQuotaResponse>>();

      container.listen(
        getDetailQuotaProvider(id: 'PLAN-001'),
        listener.call,
        fireImmediately: true,
      );

      print('--- Provider state setelah listen ---');

      // Act
      // Provider melempar Left(failure) → fold → throw failure
      // Maka .future akan reject dengan Failure — tangkap pakai catchError
      try {
        await container.read(getDetailQuotaProvider(id: 'PLAN-001').future);
      } catch (_) {
        // Expected — Failure dilempar dari provider
      }
      print('--- Provider state setelah catchError ---');

      // Assert — state akhir harus AsyncError berisi Failure
      final finalState = container.read(getDetailQuotaProvider(id: 'PLAN-001'));
      expect(finalState, isA<AsyncError<DetailQuotaResponse>>());
      expect(finalState.error, equals(tFailure));

      verify(() => mockUsecase.call(id: 'PLAN-001')).called(1);
      verifyNoMoreInteractions(mockUsecase);
    });
  });
}
