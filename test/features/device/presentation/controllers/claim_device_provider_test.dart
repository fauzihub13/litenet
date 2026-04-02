import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/usecases/claim_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/claim_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockClaimDeviceUsecase extends Mock implements ClaimDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockClaimDeviceUsecase mockClaimUsecase;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<ClaimDeviceResponse?>());
  });

  setUp(() {
    mockClaimUsecase = MockClaimDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        claimDeviceUsecaseProvider.overrideWithValue(mockClaimUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('ClaimDeviceProvider', () {
    final tResponse = ClaimDeviceResponse(success: true, message: 'Success');

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(claimDeviceProvider.future);
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockClaimUsecase.call(
          name: any(named: 'name'),
          address: any(named: 'address'),
          kitSerialNumber: any(named: 'kitSerialNumber'),
          nodelink: any(named: 'nodelink'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(claimDeviceProvider.future);

      final listener = Listener<AsyncValue<ClaimDeviceResponse?>>();
      container.listen(
        claimDeviceProvider,
        listener.call,
        fireImmediately: true,
      );

      await container
          .read(claimDeviceProvider.notifier)
          .claimDevice(
            name: 'test',
            address: 'test',
            kitSerialNumber: 'test',
            nodelink: 'test',
            latitude: 0.0,
            longitude: 0.0,
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
        () => mockClaimUsecase.call(
          name: any(named: 'name'),
          address: any(named: 'address'),
          kitSerialNumber: any(named: 'kitSerialNumber'),
          nodelink: any(named: 'nodelink'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(claimDeviceProvider.future);

      final listener = Listener<AsyncValue<ClaimDeviceResponse?>>();
      container.listen(
        claimDeviceProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(claimDeviceProvider.notifier);

      // act
      await notifier.claimDevice(
        name: 'test',
        address: 'test',
        kitSerialNumber: 'test',
        nodelink: 'test',
        latitude: 0.0,
        longitude: 0.0,
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ClaimDeviceResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(claimDeviceProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
