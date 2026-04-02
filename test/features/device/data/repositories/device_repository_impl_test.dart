import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/datasources/device_datasource.dart';
import 'package:litenet/features/device/data/repositories/device_repository_impl.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceDatasource extends Mock implements DeviceDatasource {}

void main() {
  late MockDeviceDatasource mockDatasource;
  late DeviceRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockDeviceDatasource();
    repository = DeviceRepositoryImpl(deviceDatasource: mockDatasource);
  });

  const tDeviceId = 'DEVICE-001';
  const tName = 'SATELIT XAQ';
  const tAddress = 'jalan BARU YAQ';
  const tKitSerialNumber = 'KIT0012YK9982711';
  const tNodelink = 'NDL1104PPTY2';
  const tLatitude = -6.555368;
  const tLongitude = 106.7250424;

  final tClaimDeviceResponse = ClaimDeviceResponse(
    success: true,
    message: 'Claim successful',
  );

  final tDeviceDataEntity = DeviceDataEntity(
    deviceId: tDeviceId,
    userId: 'USER-001',
    userName: 'Fauzi Adi Saputra',
    name: tName,
    kitSerialNumber: tKitSerialNumber,
    nodelink: tNodelink,
    address: tAddress,
    latitude: tLatitude,
    longitude: tLongitude,
    status: 'active',
    quotaTotal: 870400,
    quotaUsed: 0,
    quotaLeft: 870400,
    activeSince: DateTime.parse('2026-04-01 03:20:27'),
    activeUntil: '2026-04-30T20:20:27.000000Z',
    dataPlan: 'Paket 50GB',
  );

  final tDeviceResponse = DeviceResponse(
    success: true,
    message: 'All device fetched',
    data: [tDeviceDataEntity],
  );

  final tDetailDeviceResponse = DetailDeviceResponse(
    success: true,
    message: 'Berhasil mengambil detail monitoring',
    data: tDeviceDataEntity,
  );

  final tTopupDataEntity = HistoryDeviceDataEntity(
    id: 'D-01',
    deviceId: tDeviceId,
    kitSerialNumber: tKitSerialNumber,
    nodelink: tNodelink,
    name: tName,
    latitude: tLatitude,
    longitude: tLongitude,
    detailAddress: tAddress,
    createdAt: DateTime(2026, 3, 11),
    updatedAt: DateTime(2026, 3, 11),
  );

  final tHistoryDeviceResponse = HistoryDeviceResponse(
    success: true,
    message: 'Berhasil mendapatkan riwayat perangkat',
    data: [tTopupDataEntity],
  );

  final tTopupHistoryDeviceResponse = TopupHistoryDeviceResponse(
    success: true,
    message: 'Berhasil mengambil riwayat quota',
    data: [
      TopupHistoryDeviceDataEntity(
        id: 'T-01',
        deviceId: tDeviceId,
        dataPlanId: 'PLAN-001',
        startAt: DateTime(2026, 3, 11),
        endAt: DateTime(2026, 3, 11),
        price: 550000,
        packageName: 'Paket 300GB',
        capacity: '300GB',
        quotaTotal: 307200,
        quotaUsed: 0,
        createdAt: DateTime(2026, 3, 11),
        updatedAt: DateTime(2026, 3, 11),
        deletedAt: null,
      ),
    ],
  );

  group('DeviceRepositoryImpl', () {
    group('claimDevice', () {
      test(
        'should return ClaimDeviceResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.claimDevice(
              name: tName,
              address: tAddress,
              kitSerialNumber: tKitSerialNumber,
              nodelink: tNodelink,
              latitude: tLatitude,
              longitude: tLongitude,
            ),
          ).thenAnswer((_) async => tClaimDeviceResponse);

          // act
          final result = await repository.claimDevice(
            name: tName,
            adress: tAddress,
            kitSerialNumber: tKitSerialNumber,
            nodelink: tNodelink,
            latitude: tLatitude,
            longitude: tLongitude,
          );

          // assert
          expect(result, Right(tClaimDeviceResponse));
          verify(
            () => mockDatasource.claimDevice(
              name: tName,
              address: tAddress,
              kitSerialNumber: tKitSerialNumber,
              nodelink: tNodelink,
              latitude: tLatitude,
              longitude: tLongitude,
            ),
          ).called(1);
        },
      );

      test('should return Failure when datasource returns !success', () async {
        // arrange
        final tFailResponse = ClaimDeviceResponse(
          success: false,
          message: 'Claim failed',
        );
        when(
          () => mockDatasource.claimDevice(
            name: tName,
            address: tAddress,
            kitSerialNumber: tKitSerialNumber,
            nodelink: tNodelink,
            latitude: tLatitude,
            longitude: tLongitude,
          ),
        ).thenAnswer((_) async => tFailResponse);

        // act
        final result = await repository.claimDevice(
          name: tName,
          adress: tAddress,
          kitSerialNumber: tKitSerialNumber,
          nodelink: tNodelink,
          latitude: tLatitude,
          longitude: tLongitude,
        );

        // assert
        result.fold((failure) {
          expect(failure, isA<Failure>());
          expect(failure.message, 'Claim failed');
        }, (_) => fail('Should not be success'));
      });
    });

    group('getAllDevice', () {
      test(
        'should return DeviceResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getAllDevice(),
          ).thenAnswer((_) async => tDeviceResponse);

          // act
          final result = await repository.getAllDevice();

          // assert
          expect(result, Right(tDeviceResponse));
          verify(() => mockDatasource.getAllDevice()).called(1);
        },
      );
    });

    group('getDetailDevice', () {
      test(
        'should return DetailDeviceResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getDetailDevice(deviceId: tDeviceId),
          ).thenAnswer((_) async => tDetailDeviceResponse);

          // act
          final result = await repository.getDetailDevice(deviceId: tDeviceId);

          // assert
          expect(result, Right(tDetailDeviceResponse));
          verify(
            () => mockDatasource.getDetailDevice(deviceId: tDeviceId),
          ).called(1);
        },
      );
    });

    group('getTopupHistoryDevice', () {
      test(
        'should return TopupHistoryDeviceResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getTopupHistoryDevice(deviceId: tDeviceId),
          ).thenAnswer((_) async => tTopupHistoryDeviceResponse);

          // act
          final result = await repository.getTopupHistoryDevice(
            deviceId: tDeviceId,
          );

          // assert
          expect(result, Right(tTopupHistoryDeviceResponse));
          verify(
            () => mockDatasource.getTopupHistoryDevice(deviceId: tDeviceId),
          ).called(1);
        },
      );
    });

    group('updateDevice', () {
      test(
        'should return ClaimDeviceResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.updateDevice(
              deviceId: tDeviceId,
              name: tName,
              address: tAddress,
              kitSerialNumber: tKitSerialNumber,
              nodelink: tNodelink,
              latitude: tLatitude,
              longitude: tLongitude,
              status: true,
            ),
          ).thenAnswer((_) async => tClaimDeviceResponse);

          // act
          final result = await repository.updateDevice(
            deviceId: tDeviceId,
            name: tName,
            adress: tAddress,
            kitSerialNumber: tKitSerialNumber,
            nodelink: tNodelink,
            latitude: tLatitude,
            longitude: tLongitude,
            status: true,
          );

          // assert
          expect(result, Right(tClaimDeviceResponse));
          verify(
            () => mockDatasource.updateDevice(
              deviceId: tDeviceId,
              name: tName,
              address: tAddress,
              kitSerialNumber: tKitSerialNumber,
              nodelink: tNodelink,
              latitude: tLatitude,
              longitude: tLongitude,
              status: true,
            ),
          ).called(1);
        },
      );
    });

    group('getHistoryDevice', () {
      test(
        'should return HistoryDeviceResponse when datasource returns success',
        () async {
          // arrange
          when(
            () => mockDatasource.getHistoryDevice(deviceId: tDeviceId),
          ).thenAnswer((_) async => tHistoryDeviceResponse);

          // act
          final result = await repository.getHistoryDevice(deviceId: tDeviceId);

          // assert
          expect(result, Right(tHistoryDeviceResponse));
          verify(
            () => mockDatasource.getHistoryDevice(deviceId: tDeviceId),
          ).called(1);
        },
      );
    });
  });
}
