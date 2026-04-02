import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';
import 'package:litenet/features/device/domain/usecases/update_device_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceRepository extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepository mockRepository;

  late UpdateDeviceUsecase updateDeviceUsecase;

  setUp(() {
    mockRepository = MockDeviceRepository();

    updateDeviceUsecase = UpdateDeviceUsecase(mockRepository);
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
    message: 'Success',
  );

  group('UpdateDeviceUsecase', () {
    test('should call updateDevice from repository', () async {
      // arrange
      when(
        () => mockRepository.updateDevice(
          deviceId: tDeviceId,
          name: tName,
          adress: tAddress,
          kitSerialNumber: tKitSerialNumber,
          nodelink: tNodelink,
          latitude: tLatitude,
          longitude: tLongitude,
          status: true,
        ),
      ).thenAnswer((_) async => Right(tClaimDeviceResponse));

      // act
      final result = await updateDeviceUsecase(
        deviceId: tDeviceId,
        name: tName,
        address: tAddress,
        kitSerialNumber: tKitSerialNumber,
        nodelink: tNodelink,
        latitude: tLatitude,
        longitude: tLongitude,
        status: true,
      );

      // assert
      expect(result, Right(tClaimDeviceResponse));
      verify(
        () => mockRepository.updateDevice(
          deviceId: tDeviceId,
          name: tName,
          adress: tAddress,
          kitSerialNumber: tKitSerialNumber,
          nodelink: tNodelink,
          latitude: tLatitude,
          longitude: tLongitude,
          status: true,
        ),
      ).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Network error');
      when(
        () => mockRepository.updateDevice(
          deviceId: tDeviceId,
          name: tName,
          adress: tAddress,
          kitSerialNumber: tKitSerialNumber,
          nodelink: tNodelink,
          latitude: tLatitude,
          longitude: tLongitude,
          status: true,
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await updateDeviceUsecase(
        deviceId: tDeviceId,
        name: tName,
        address: tAddress,
        kitSerialNumber: tKitSerialNumber,
        nodelink: tNodelink,
        latitude: tLatitude,
        longitude: tLongitude,
        status: true,
      );

      // assert
      expect(result, Left(tFailure));
    });
  });
}
