import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/usecases/update_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/update_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockUpdateDeviceUsecase extends Mock implements UpdateDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockUpdateDeviceUsecase mockUpdateUsecase;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<ClaimDeviceResponse?>());
  });

  setUp(() {
    mockUpdateUsecase = MockUpdateDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        updateDeviceUsecaseProvider.overrideWithValue(mockUpdateUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('UpdateDeviceProvider', () {
    final tResponse = ClaimDeviceResponse(success: true, message: 'Success');

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(updateDeviceProvider.future);
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockUpdateUsecase.call(
          deviceId: any(named: 'deviceId'),
          name: any(named: 'name'),
          address: any(named: 'address'),
          kitSerialNumber: any(named: 'kitSerialNumber'),
          nodelink: any(named: 'nodelink'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          status: any(named: 'status'),
        ),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(updateDeviceProvider.future);

      final listener = Listener<AsyncValue<ClaimDeviceResponse?>>();
      container.listen(
        updateDeviceProvider,
        listener.call,
        fireImmediately: true,
      );

      await container
          .read(updateDeviceProvider.notifier)
          .updateDevice(
            deviceId: '1',
            name: 'test',
            address: 'test',
            kitSerialNumber: 'test',
            nodelink: 'test',
            latitude: 0.0,
            longitude: 0.0,
            status: true,
          );

      verifyInOrder([
        () => listener(any(), const AsyncData<ClaimDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<ClaimDeviceResponse?>(tResponse)),
      ]);
    });
    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockUpdateUsecase.call(
          deviceId: any(named: 'deviceId'),
          name: any(named: 'name'),
          address: any(named: 'address'),
          kitSerialNumber: any(named: 'kitSerialNumber'),
          nodelink: any(named: 'nodelink'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          status: any(named: 'status'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(updateDeviceProvider.future);

      final listener = Listener<AsyncValue<ClaimDeviceResponse?>>();
      container.listen(
        updateDeviceProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(updateDeviceProvider.notifier);

      // act
      await notifier.updateDevice(
        deviceId: '1',
        name: 'test',
        address: 'test',
        kitSerialNumber: 'test',
        nodelink: 'test',
        latitude: 0.0,
        longitude: 0.0,
        status: true,
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ClaimDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(updateDeviceProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
