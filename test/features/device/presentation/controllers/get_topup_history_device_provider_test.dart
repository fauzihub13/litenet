import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:litenet/features/device/domain/usecases/get_topup_hisotry_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/get_topup_history_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTopupHistoryDeviceUsecase extends Mock
    implements GetTopupHistoryDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetTopupHistoryDeviceUsecase mockGetTopupHistoryUsecase;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<TopupHistoryDeviceResponse?>());
  });

  setUp(() {
    mockGetTopupHistoryUsecase = MockGetTopupHistoryDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        getTopupHistoryDeviceUsecaseProvider.overrideWithValue(
          mockGetTopupHistoryUsecase,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('GetTopupHistoryDeviceProvider', () {
    final tResponse = TopupHistoryDeviceResponse(
      success: true,
      message: 'Success',
      data: [],
    );

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(
        getTopupHistoryDeviceProvider(deviceId: '1').future,
      );
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockGetTopupHistoryUsecase.call(deviceId: any(named: 'deviceId')),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(getTopupHistoryDeviceProvider(deviceId: '1').future);

      final listener = Listener<AsyncValue<TopupHistoryDeviceResponse?>>();
      container.listen(
        getTopupHistoryDeviceProvider(deviceId: '1'),
        listener.call,
        fireImmediately: true,
      );
      await container
          .read(getTopupHistoryDeviceProvider(deviceId: '1').notifier)
          .fetchTopupHistoryDevice('1');
      verifyInOrder([
        () =>
            listener(any(), const AsyncData<TopupHistoryDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () =>
            listener(any(), AsyncData<TopupHistoryDeviceResponse?>(tResponse)),
      ]);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockGetTopupHistoryUsecase.call(deviceId: any(named: 'deviceId')),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getTopupHistoryDeviceProvider(deviceId: '1').future);

      final listener = Listener<AsyncValue<TopupHistoryDeviceResponse?>>();
      container.listen(
        getTopupHistoryDeviceProvider(deviceId: '1'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getTopupHistoryDeviceProvider(deviceId: '1').notifier,
      );

      // act
      await notifier.fetchTopupHistoryDevice('1');

      // assert
      verifyInOrder([
        () =>
            listener(any(), const AsyncData<TopupHistoryDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(
        getTopupHistoryDeviceProvider(deviceId: '1'),
      );
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
