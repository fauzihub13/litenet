import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/device/data/datasources/device_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late DeviceDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = DeviceDatasourceImpl(httpClient: mockDio);
  });

  group('DeviceDatasourceImpl', () {
    group('claimDevice', () {
      final tResponsePayload = {'success': true, 'message': 'Claim successful'};

      test(
        'should return claimdevice when response is successful (200)',
        () async {
          // arrange
          when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
            (_) async => Response(
              data: tResponsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.claimDevice(
            name: "Dummy Device",
            address: "Jl. Dummy No. 123",
            kitSerialNumber: "KIT-123456",
            nodelink: "NODE-ABC",
            latitude: -6.2000,
            longitude: 106.8166,
          );

          // assert
          expect(result.success, true);
          expect(result.message, 'Claim successful');
          verify(() => mockDio.post(any(), data: any(named: 'data'))).called(1);
        },
      );

      test('should throw Exception when dio throws', () async {
        // arrange
        when(
          () => mockDio.post(any(), data: any(named: 'data')),
        ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

        // act
        final call = datasource.claimDevice;

        // assert
        expect(
          () => call(
            name: "Dummy Device",
            address: "Jl. Dummy No. 123",
            kitSerialNumber: "KIT-123456",
            nodelink: "NODE-ABC",
            latitude: -6.2000,
            longitude: 106.8166,
          ),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('updateDevice', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Update successful',
      };

      test(
        'should return updateDevice when response is successful (200)',
        () async {
          // arrange
          when(() => mockDio.put(any(), data: any(named: 'data'))).thenAnswer(
            (_) async => Response(
              data: tResponsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.updateDevice(
            deviceId: "DEVICE-001",
            status: true,
            name: "Dummy Device",
            address: "Jl. Dummy No. 123, Jakarta",
            kitSerialNumber: "KIT-123456789",
            nodelink: "NODE-ABC-001",
            latitude: -6.2000,
            longitude: 106.8166,
          );

          // assert
          expect(result.success, true);
          expect(result.message, 'Update successful');
          verify(() => mockDio.put(any(), data: any(named: 'data'))).called(1);
        },
      );

      test('should throw Exception when dio throws', () async {
        // arrange
        when(
          () => mockDio.put(any(), data: any(named: 'data')),
        ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

        // act
        final call = datasource.updateDevice;

        // assert
        expect(
          () => call(
            deviceId: "DEVICE-001",
            status: true,
            name: "Dummy Device",
            address: "Jl. Dummy No. 123",
            kitSerialNumber: "KIT-123456",
            nodelink: "NODE-ABC",
            latitude: -6.2000,
            longitude: 106.8166,
          ),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('getAllDevice', () {
      final tSummaryResponse = {
        'success': true,
        'message': 'All device fetched',
        'data': [
          {
            "device_id": "DEVICE-001",
            "user_id": "019caf80-a76b-71fc-b3cc-f99389f708b8",
            "user_name": "Fauzi Adi Saputra",
            "name": "SATELIT  XAQ",
            "kit_serial_number": "KIT0012YK9982711",
            "nodelink": "NDL1104PPTY2",
            "address": "jalan BARU YAQ",
            "latitude": -6.555368,
            "longitude": 106.7250424,
            "status": "active",
            "quota_total": 870400,
            "quota_used": 0,
            "quota_left": 870400,
            "active_since": "2026-04-01 03:20:27",
            "active_until": "2026-04-30T20:20:27.000000Z",
            "data_plan": "Paket 50GB",
          },
        ],
      };

      test(
        'should return AllDeviceResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tSummaryResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getAllDevice();

          // assert
          expect(result.success, true);
          expect(result.data.first.deviceId, 'DEVICE-001');
        },
      );
    });

    group('getDetailDevice', () {
      final tSummaryResponse = {
        "success": true,
        "message": "Berhasil mengambil detail monitoring",
        "data": {
          "device_id": "DEVICE-001",
          "user_id": "019caf80-a76b-71fc-b3cc-f99389f708b8",
          "user_name": "Fauzi Adi Saputra",
          "name": "SATELIT  XAQ",
          "kit_serial_number": "KIT0012YK9982711",
          "nodelink": "NDL1104PPTY2",
          "address": "jalan BARU YAQ",
          "latitude": -6.555368,
          "longitude": 106.7250424,
          "status": "active",
          "quota_total": 870400,
          "quota_used": 0,
          "quota_left": 870400,
          "active_since": "2026-04-01 03:20:27",
          "active_until": "2026-04-30T20:20:27.000000Z",
          "data_plan": "Paket 50GB",
        },
      };

      test(
        'should return DetailDeviceResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tSummaryResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getDetailDevice(
            deviceId: 'DEVICE-001',
          );

          // assert
          expect(result.success, true);
          expect(result.data.deviceId, 'DEVICE-001');
        },
      );
    });

    group('getHistoryDevice', () {
      final tSummaryResponse = {
        "success": true,
        "message": "Berhasil mendapatkan riwayat perangkat",
        "data": [
          {
            "id": "D-01",
            "device_id": "019cb94d-4bcb-7371-a06f-b7c491d5381c",
            "kit_serial_number": "KIT0012YK9982711",
            "nodelink": "NDL1104PPTY2",
            "name": "SATELIT  XAQ",
            "latitude": -6.555368,
            "longitude": 106.7250424,
            "detail_address": "jalan BARU YAQ",
            "created_at": "2026-03-16T12:53:11.000000Z",
            "updated_at": "2026-03-16T12:53:11.000000Z",
          },
          {
            "id": "D-02",
            "device_id": "019cb94d-4bcb-7371-a06f-b7c491d5381c",
            "kit_serial_number": "KIT0012YK9982711",
            "nodelink": "NDL1104PPTY2",
            "name": "SATELIT  XAQ",
            "latitude": -6.555368,
            "longitude": 106.7250424,
            "detail_address": "jalan BARU YAQ",
            "created_at": "2026-03-16T10:33:04.000000Z",
            "updated_at": "2026-03-16T10:33:04.000000Z",
          },
        ],
      };

      test(
        'should return HistoryDeviceResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tSummaryResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getHistoryDevice(deviceId: 'D-01');

          // assert
          expect(result.success, true);
          expect(result.data.first.id, 'D-01');
        },
      );
    });

    group('getTopUpHistoryDevice', () {
      final tSummaryResponse = {
        "success": true,
        "message": "Berhasil mengambil riwayat quota",
        "data": [
          {
            "id": "T-01",
            "device_id": "019cb94d-4bcb-7371-a06f-b7c491d5381c",
            "data_plan_id": "019cbe14-090b-71a1-8849-726ae5dc336c",
            "start_at": "2026-03-11T23:51:39.000000Z",
            "end_at": "2026-04-11T23:51:39.000000Z",
            "price": 550000,
            "package_name": "Paket 300GB",
            "capacity": "300GB",
            "quota_total": 307200,
            "quota_used": 0,
            "created_at": "2026-03-11T23:51:39.000000Z",
            "updated_at": "2026-03-11T23:51:39.000000Z",
            "deleted_at": null,
          },
          {
            "id": "T-02",
            "device_id": "019cb94d-4bcb-7371-a06f-b7c491d5381c",
            "data_plan_id": "019cbe13-b2e1-7079-be41-fa71468bb66c",
            "start_at": "2026-03-31T20:16:52.000000Z",
            "end_at": "2026-04-30T20:16:52.000000Z",
            "price": 130000,
            "package_name": "Paket 50GB",
            "capacity": "50GB",
            "quota_total": 51200,
            "quota_used": 0,
            "created_at": "2026-03-31T20:16:52.000000Z",
            "updated_at": "2026-03-31T20:16:52.000000Z",
            "deleted_at": null,
          },
        ],
      };

      test(
        'should return TopUpHistoryDeviceResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tSummaryResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getTopupHistoryDevice(
            deviceId: 'D-01',
          );

          // assert
          expect(result.success, true);
          expect(result.data.first.id, 'T-01');
        },
      );
    });
  });
}
