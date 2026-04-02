import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';
import 'package:litenet/features/device/domain/usecases/get_all_device_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceRepository extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepository mockRepository;
  late GetAllDeviceUsecase getAllDeviceUsecase;

  setUp(() {
    mockRepository = MockDeviceRepository();
    getAllDeviceUsecase = GetAllDeviceUsecase(mockRepository);
  });

  const tDeviceId = 'DEVICE-001';
  const tName = 'SATELIT XAQ';
  const tAddress = 'jalan BARU YAQ';
  const tKitSerialNumber = 'KIT0012YK9982711';
  const tNodelink = 'NDL1104PPTY2';
  const tLatitude = -6.555368;
  const tLongitude = 106.7250424;

  final tDeviceData = DeviceDataEntity(
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
    activeSince: DateTime(2026, 4, 1),
    activeUntil: '2026-04-30',
    dataPlan: 'Paket 50GB',
  );

  final tDeviceResponse = DeviceResponse(
    success: true,
    message: 'Success',
    data: [tDeviceData],
  );

  group('GetAllDeviceUsecase', () {
    test('should call getAllDevice from repository', () async {
      // arrange
      when(
        () => mockRepository.getAllDevice(),
      ).thenAnswer((_) async => Right(tDeviceResponse));

      // act
      final result = await getAllDeviceUsecase();

      // assert
      expect(result, Right(tDeviceResponse));
      verify(() => mockRepository.getAllDevice()).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Network error');
      when(
        () => mockRepository.getAllDevice(),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await getAllDeviceUsecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
