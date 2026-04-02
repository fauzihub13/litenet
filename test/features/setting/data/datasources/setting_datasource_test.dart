import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late SettingDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = SettingDatasourceImpl(httpClient: mockDio);
  });

  group('SettingDatasourceImpl', () {
    group('getProfile', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Profile fetched',
        'data': {
          'id': 'USR-001',
          'name': 'Test User',
          'email': 'test@example.com',
        },
      };

      test(
        'should return ProfileResponse when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tResponsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getProfile();

          // assert
          expect(result.success, true);
          expect(result.data.id, 'USR-001');
        },
      );
    });

    group('logout', () {
      final tResponsePayload = {'success': true, 'message': 'Logout success'};

      test(
        'should return LogoutResponse when response is successful',
        () async {
          // arrange
          when(() => mockDio.post(any())).thenAnswer(
            (_) async => Response(
              data: tResponsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.logout();

          // assert
          expect(result.success, true);
        },
      );
    });

    group('changeProfile', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Profile updated',
        'data': {'id': 'USR-001', 'name': 'Updated Name'},
      };

      test(
        'should return ProfileResponse when response is successful',
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
          final result = await datasource.changeProfile(
            name: 'Updated Name',
            email: 'test@example.com',
            phoneNumber: '12345',
          );

          // assert
          expect(result.success, true);
          expect(result.data.name, 'Updated Name');
        },
      );
    });

    group('changePassword', () {
      final tResponsePayload = {
        "success": true,
        "message": "Kata sandi berhasil diperbarui",
        "data": null,
      };

      test(
        'should return ChangePasswordResponse when response is successful',
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
          final result = await datasource.changePassword(
            oldPassword: 'oldPass',
            newPassword: 'newPass',
            confirmNewPassword: 'newPass',
          );

          // assert
          expect(result.success, true);
          verify(() => mockDio.put(any(), data: any(named: 'data'))).called(1);
        },
      );

      test('should throw DioException when dio throws', () async {
        // arrange
        when(
          () => mockDio.put(any(), data: any(named: 'data')),
        ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

        // act
        final call = datasource.changePassword;

        // assert
        expect(
          () => call(
            oldPassword: 'oldPass',
            newPassword: 'newPass',
            confirmNewPassword: 'newPass',
          ),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('getFAQ', () {
      final tResponsePayload = {
        'success': true,
        'message': 'FAQs fetched',
        'data': [
          {'id': 'FAQ-001', 'question': 'Q?', 'answer': 'A'},
        ],
      };

      test('should return FAQResponse when response is successful', () async {
        // arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tResponsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final result = await datasource.getFAQ();

        // assert
        expect(result.success, true);
        expect(result.data.first.id, 'FAQ-001');
      });
    });

    group('getPrivacyAndPolicy', () {
      final tResponsePayload = {
        "success": true,
        "message": "Privacy Policy",
        "data": [
          {
            "id": "TNC-001",
            "slug": "informasi-yang-kami-kumpulkan",
            "title": "Informasi yang Kami Kumpulkan",
            "description": "Kami mengumpulkan informasi yang Anda berikan ",
            "created_at": "2026-03-04T00:50:19.000000Z",
            "updated_at": "2026-03-04T00:50:19.000000Z",
            "deleted_at": null,
          },
          {
            "id": "TNC-002",
            "slug": "penggunaan-informasi-anda",
            "title": "Penggunaan Informasi Anda",
            "description":
                "Data yang dikumpulkan digunakan untuk memproses transaksi top-up.",
            "created_at": "2026-03-04T00:50:25.000000Z",
            "updated_at": "2026-03-04T00:50:25.000000Z",
            "deleted_at": null,
          },
        ],
      };

      test(
        'should return PrivacyAndPolicyResponse when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tResponsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getPrivacyAndPolicy();

          // assert
          expect(result.success, true);
          expect(result.data.first.id, 'TNC-001');
        },
      );
    });
  });
}
