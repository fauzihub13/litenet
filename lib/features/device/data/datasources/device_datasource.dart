import 'package:dio/dio.dart';
import 'package:litenet/features/device/data/mappers/claim_device_mapper.dart';
import 'package:litenet/features/device/data/mappers/detail_device_mapper.dart';
import 'package:litenet/features/device/data/mappers/device_mapper.dart';
import 'package:litenet/features/device/data/mappers/history_device_mapper.dart';
import 'package:litenet/features/device/data/mappers/topup_history_device_mapper.dart';
import 'package:litenet/features/device/data/models/claim_device_model.dart';
import 'package:litenet/features/device/data/models/detail_device_model.dart';
import 'package:litenet/features/device/data/models/device_model.dart';
import 'package:litenet/features/device/data/models/history_device_model.dart';
import 'package:litenet/features/device/data/models/topup_history_device_model.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';

abstract class DeviceDatasource {
  Future<ClaimDeviceResponse> claimDevice({
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  });
  Future<DeviceResponse> getAllDevice();
  Future<DetailDeviceResponse> getDetailDevice({required String deviceId});
  Future<TopupHistoryDeviceResponse> getTopupHistoryDevice({
    required String deviceId,
  });
  Future<ClaimDeviceResponse> updateDevice({
    required String deviceId,
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
    required bool status,
  });
  Future<HistoryDeviceResponse> getHistoryDevice({required String deviceId});
}

class DeviceDatasourceImpl extends DeviceDatasource {
  final Dio httpClient;
  DeviceDatasourceImpl({required this.httpClient});

  @override
  Future<ClaimDeviceResponse> claimDevice({
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  }) async {
    String url = '/devices/claim';
    final response = await httpClient.post(
      url,
      data: {
        "name": name,
        "address": address,
        "kit_serial_number": kitSerialNumber,
        "nodelink": nodelink,
        "latitude": latitude,
        "longitude": longitude,
      },
    );

    final data = ClaimDeviceResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<DeviceResponse> getAllDevice() async {
    String url = '/monitoring/devices';
    final response = await httpClient.get(url);

    final data = DeviceResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<DetailDeviceResponse> getDetailDevice({
    required String deviceId,
  }) async {
    String url = '/monitoring/devices/$deviceId';
    final response = await httpClient.get(url);

    final data = DetailDeviceResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<TopupHistoryDeviceResponse> getTopupHistoryDevice({
    required String deviceId,
  }) async {
    String url = '/monitoring/devices/$deviceId/histories';
    final response = await httpClient.get(url);

    final data = TopupHistoryDeviceResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<ClaimDeviceResponse> updateDevice({
    required String deviceId,
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
    required bool status,
  }) async {
    String url = '/devices/$deviceId/update';
    final response = await httpClient.put(
      url,
      data: {
        "name": name,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
      },
    );

    final data = ClaimDeviceResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<HistoryDeviceResponse> getHistoryDevice({
    required String deviceId,
  }) async {
    String url = '/devices/$deviceId/history';
    final response = await httpClient.get(url);

    final data = HistoryDeviceResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
