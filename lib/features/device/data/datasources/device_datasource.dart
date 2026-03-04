import 'package:dio/dio.dart';
import 'package:litenet/features/device/data/mappers/claim_device_mapper.dart';
import 'package:litenet/features/device/data/models/claim_device_model.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';

abstract class DeviceDatasource {
  Future<ClaimDeviceResponse> claimDevice({
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  });
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
}
