import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/usecases/get_detail_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/get_detail_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDetailDeviceUsecase extends Mock
    implements GetDetailDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetDetailDeviceUsecase mockGetDetailUsecase;

  late ProviderContainer container;

  final tDeviceData = DeviceDataEntity(
    deviceId: '1',
    userId: '1',
    userName: '1',
    name: '1',
    kitSerialNumber: '1',
    nodelink: '1',
    address: '1',
    latitude: 1,
    longitude: 1,
    status: '1',
    quotaTotal: 1,
    quotaUsed: 1,
    quotaLeft: 1,
    activeSince: DateTime(2026, 4, 1),
    activeUntil: '1',
    dataPlan: '1',
  );

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<DetailDeviceResponse?>());
  });

  setUp(() {
    mockGetDetailUsecase = MockGetDetailDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        getDetailDeviceUsecaseProvider.overrideWithValue(mockGetDetailUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('GetDetailDeviceProvider', () {
    final tResponse = DetailDeviceResponse(
      success: true,
      message: 'Success',
      data: tDeviceData,
    );

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(
        getDetailDeviceProvider(deviceId: '1').future,
      );
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockGetDetailUsecase.call(deviceId: any(named: 'deviceId')),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(getDetailDeviceProvider(deviceId: '1').future);

      final listener = Listener<AsyncValue<DetailDeviceResponse?>>();
      container.listen(
        getDetailDeviceProvider(deviceId: '1'),
        listener.call,
        fireImmediately: true,
      );

      await container
          .read(getDetailDeviceProvider(deviceId: '1').notifier)
          .fetchDetailDevice('1');
      verifyInOrder([
        () => listener(any(), const AsyncData<DetailDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<DetailDeviceResponse?>(tResponse)),
      ]);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockGetDetailUsecase.call(deviceId: any(named: 'deviceId')),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getDetailDeviceProvider(deviceId: '1').future);

      final listener = Listener<AsyncValue<DetailDeviceResponse?>>();
      container.listen(
        getDetailDeviceProvider(deviceId: '1'),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(
        getDetailDeviceProvider(deviceId: '1').notifier,
      );

      // act
      await notifier.fetchDetailDevice('1');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<DetailDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getDetailDeviceProvider(deviceId: '1'));
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
