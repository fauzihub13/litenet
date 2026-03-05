import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class GetAllDeviceUsecase {
  final DeviceRepository deviceRepository;

  const GetAllDeviceUsecase(this.deviceRepository);

  Future<Either<Failure, DeviceResponse>> call() async {
    return await deviceRepository.getAllDevice();
  }
}
