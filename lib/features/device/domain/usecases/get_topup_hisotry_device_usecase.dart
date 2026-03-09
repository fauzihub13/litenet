import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class GetTopupHistoryDeviceUsecase {
  final DeviceRepository deviceRepository;

  const GetTopupHistoryDeviceUsecase(this.deviceRepository);

  Future<Either<Failure, TopupHistoryDeviceResponse>> call({
    required String deviceId,
  }) async {
    return await deviceRepository.getTopupHistoryDevice(deviceId: deviceId);
  }
}
