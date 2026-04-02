import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/usecases/get_history_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/get_history_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetHistoryDeviceUsecase extends Mock
    implements GetHistoryDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetHistoryDeviceUsecase mockGetHistoryUsecase;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<HistoryDeviceResponse?>());
  });

  setUp(() {
    mockGetHistoryUsecase = MockGetHistoryDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        getHistoryDeviceUsecaseProvider.overrideWithValue(
          mockGetHistoryUsecase,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('GetHistoryDeviceProvider', () {
    final tResponse = HistoryDeviceResponse(
      success: true,
      message: 'Success',
      data: [],
    );

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(
        getHistoryDeviceProvider(deviceId: '1').future,
      );
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockGetHistoryUsecase.call(deviceId: any(named: 'deviceId')),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(getHistoryDeviceProvider(deviceId: '1').future);

      final listener = Listener<AsyncValue<HistoryDeviceResponse?>>();
      container.listen(
        getHistoryDeviceProvider(deviceId: '1'),
        listener.call,
        fireImmediately: true,
      );
      await container
          .read(getHistoryDeviceProvider(deviceId: '1').notifier)
          .fetchHistoryDevice('1');
      verifyInOrder([
        () => listener(any(), const AsyncData<HistoryDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<HistoryDeviceResponse?>(tResponse)),
      ]);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockGetHistoryUsecase.call(deviceId: any(named: 'deviceId')),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getHistoryDeviceProvider(deviceId: '1').future);

      final listener = Listener<AsyncValue<HistoryDeviceResponse?>>();
      container.listen(
        getHistoryDeviceProvider(deviceId: '1'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getHistoryDeviceProvider(deviceId: '1').notifier,
      );

      // act
      await notifier.fetchHistoryDevice('1');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<HistoryDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(
        getHistoryDeviceProvider(deviceId: '1'),
      );
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
