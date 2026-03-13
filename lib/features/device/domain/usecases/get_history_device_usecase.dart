import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class GetHistoryDeviceUsecase {
  final DeviceRepository deviceRepository;

  const GetHistoryDeviceUsecase(this.deviceRepository);

  Future<Either<Failure, HistoryDeviceResponse>> call({
    required String deviceId,
  }) async {
    return await deviceRepository.getHistoryDevice(deviceId: deviceId);
  }
}
