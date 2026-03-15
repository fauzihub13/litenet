import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';

abstract class DeviceRepository {
  Future<Either<Failure, ClaimDeviceResponse>> claimDevice({
    required String name,
    required String adress,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  });
  Future<Either<Failure, DeviceResponse>> getAllDevice();
  Future<Either<Failure, DetailDeviceResponse>> getDetailDevice({
    required String deviceId,
  });
  Future<Either<Failure, TopupHistoryDeviceResponse>> getTopupHistoryDevice({
    required String deviceId,
  });
  Future<Either<Failure, ClaimDeviceResponse>> updateDevice({
    required String deviceId,
    required String name,
    required String adress,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
    required bool status,
  });
   Future<Either<Failure, HistoryDeviceResponse>> getHistoryDevice({
    required String deviceId,
  });
}
