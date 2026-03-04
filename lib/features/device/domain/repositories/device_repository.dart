import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';

abstract class DeviceRepository {
  Future<Either<Failure, ClaimDeviceResponse>> claimDevice({
    required String name,
    required String adress,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  });
}
