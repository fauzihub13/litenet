import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class UpdateDeviceUsecase {
  final DeviceRepository deviceRepository;

  const UpdateDeviceUsecase(this.deviceRepository);

  Future<Either<Failure, ClaimDeviceResponse>> call({

    required String deviceId,
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
    required bool status,
  }) async {
    return await deviceRepository.updateDevice(
      deviceId: deviceId,
      name: name,
      adress: address,
      kitSerialNumber: kitSerialNumber,
      nodelink: nodelink,
      latitude: latitude,
      longitude: longitude,
      status: status
    );
  }
}
