import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class ClaimDeviceUsecase {
  final DeviceRepository deviceRepository;

  const ClaimDeviceUsecase(this.deviceRepository);

  Future<Either<Failure, ClaimDeviceResponse>> call({
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  }) async {
    return await deviceRepository.claimDevice(
      name: name,
      adress: address,
      kitSerialNumber: kitSerialNumber,
      nodelink: nodelink,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
