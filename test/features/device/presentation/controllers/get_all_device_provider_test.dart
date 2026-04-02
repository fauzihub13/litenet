import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/usecases/get_all_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/get_all_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllDeviceUsecase extends Mock implements GetAllDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetAllDeviceUsecase mockGetAllUsecase;
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
    registerFallbackValue(const AsyncLoading<DeviceResponse?>());
  });

  setUp(() {
    mockGetAllUsecase = MockGetAllDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        getAllDeviceUsecaseProvider.overrideWithValue(mockGetAllUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('GetAllDeviceProvider', () {
    final tResponse = DeviceResponse(
      success: true,
      message: 'Success',
      data: [tDeviceData],
    );

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getAllDeviceProvider.future);
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockGetAllUsecase.call(),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(getAllDeviceProvider.future);

      final listener = Listener<AsyncValue<DeviceResponse?>>();
      container.listen(
        getAllDeviceProvider,
        listener.call,
        fireImmediately: true,
      );

      await container.read(getAllDeviceProvider.notifier).fetchAllDevice();
      verifyInOrder([
        () => listener(any(), const AsyncData<DeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<DeviceResponse?>(tResponse)),
      ]);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockGetAllUsecase.call(),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getAllDeviceProvider.future);

      final listener = Listener<AsyncValue<DeviceResponse?>>();
      container.listen(
        getAllDeviceProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getAllDeviceProvider.notifier);

      // act
      await notifier.fetchAllDevice();

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<DeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getAllDeviceProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
