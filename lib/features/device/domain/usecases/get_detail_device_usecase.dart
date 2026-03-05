import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class GetDetailDeviceUsecase {
  final DeviceRepository deviceRepository;

  const GetDetailDeviceUsecase(this.deviceRepository);

  Future<Either<Failure, DetailDeviceResponse>> call({
    required String deviceId,
  }) async {
    return await deviceRepository.getDetailDevice(deviceId: deviceId);
  }
}
