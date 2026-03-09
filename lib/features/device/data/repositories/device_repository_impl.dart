import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/datasources/device_datasource.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  final DeviceDatasource deviceDatasource;

  DeviceRepositoryImpl({required this.deviceDatasource});

  @override
  Future<Either<Failure, ClaimDeviceResponse>> claimDevice({
    required String name,
    required String adress,

    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await deviceDatasource.claimDevice(
        name: name,
        address: adress,
        kitSerialNumber: kitSerialNumber,
        nodelink: nodelink,
        latitude: latitude,
        longitude: longitude,
      );

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeviceResponse>> getAllDevice() async {
   try {
      final response = await deviceDatasource.getAllDevice(
       
      );

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailDeviceResponse>> getDetailDevice({required String deviceId}) async {
   try {
      final response = await deviceDatasource.getDetailDevice(
        deviceId: deviceId,
      );
       

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TopupHistoryDeviceResponse>> getTopupHistoryDevice({required String deviceId}) async {
    try {
      final response = await deviceDatasource.getTopupHistoryDevice(
        deviceId: deviceId,
      );
       

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
