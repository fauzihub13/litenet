import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:litenet/features/device/domain/usecases/claim_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_all_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_detail_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_history_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_topup_hisotry_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/update_device_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/claim_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/get_all_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/get_detail_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/get_history_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/get_topup_history_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/update_device_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllDeviceUsecase extends Mock implements GetAllDeviceUsecase {}

class MockClaimDeviceUsecase extends Mock implements ClaimDeviceUsecase {}

class MockGetDetailDeviceUsecase extends Mock
    implements GetDetailDeviceUsecase {}

class MockGetHistoryDeviceUsecase extends Mock
    implements GetHistoryDeviceUsecase {}

class MockGetTopupHistoryDeviceUsecase extends Mock
    implements GetTopupHistoryDeviceUsecase {}

class MockUpdateDeviceUsecase extends Mock implements UpdateDeviceUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetAllDeviceUsecase mockGetAllUsecase;
  late MockClaimDeviceUsecase mockClaimUsecase;
  late MockGetDetailDeviceUsecase mockGetDetailUsecase;
  late MockGetHistoryDeviceUsecase mockGetHistoryUsecase;
  late MockGetTopupHistoryDeviceUsecase mockGetTopupHistoryUsecase;
  late MockUpdateDeviceUsecase mockUpdateUsecase;
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
    registerFallbackValue(const AsyncLoading<ClaimDeviceResponse?>());
    registerFallbackValue(const AsyncLoading<DetailDeviceResponse?>());
    registerFallbackValue(const AsyncLoading<HistoryDeviceResponse?>());
    registerFallbackValue(const AsyncLoading<TopupHistoryDeviceResponse?>());
  });

  setUp(() {
    mockGetAllUsecase = MockGetAllDeviceUsecase();
    mockClaimUsecase = MockClaimDeviceUsecase();
    mockGetDetailUsecase = MockGetDetailDeviceUsecase();
    mockGetHistoryUsecase = MockGetHistoryDeviceUsecase();
    mockGetTopupHistoryUsecase = MockGetTopupHistoryDeviceUsecase();
    mockUpdateUsecase = MockUpdateDeviceUsecase();

    container = ProviderContainer(
      overrides: [
        getAllDeviceUsecaseProvider.overrideWithValue(mockGetAllUsecase),
        claimDeviceUsecaseProvider.overrideWithValue(mockClaimUsecase),
        getDetailDeviceUsecaseProvider.overrideWithValue(mockGetDetailUsecase),
        getHistoryDeviceUsecaseProvider.overrideWithValue(
          mockGetHistoryUsecase,
        ),
        getTopupHistoryDeviceUsecaseProvider.overrideWithValue(
          mockGetTopupHistoryUsecase,
        ),
        updateDeviceUsecaseProvider.overrideWithValue(mockUpdateUsecase),
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
