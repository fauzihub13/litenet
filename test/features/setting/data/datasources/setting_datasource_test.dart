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
        }
      };

      test('should return ProfileResponse when response is successful', () async {
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
      });
    });

    group('logout', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Logout success',
      };

      test('should return LogoutResponse when response is successful', () async {
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
      });
    });

    group('changeProfile', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Profile updated',
        'data': {'id': 'USR-001', 'name': 'Updated Name'}
      };

      test('should return ProfileResponse when response is successful', () async {
        // arrange
        when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
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
      });
    });

    group('getFAQ', () {
      final tResponsePayload = {
        'success': true,
        'message': 'FAQs fetched',
        'data': [
          {'id': 'FAQ-001', 'question': 'Q?', 'answer': 'A'}
        ]
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
  });
}
