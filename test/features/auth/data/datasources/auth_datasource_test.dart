import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/auth/data/datasources/auth_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late AuthDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = AuthDatasourceImpl(httpClient: mockDio);
  });

  test('should return LoginResponse when response is successful', () async {
    final responsePayload = {
      'success': true,
      'message': 'ok',
      'data': {
        'user': {'id': '1', 'name': 'Test'},
        'isVerified': true,
        'token': 'token',
      },
    };
    when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response(
        data: responsePayload,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await datasource.login(email: 'a', password: 'b');
    expect(result.success, true);
    expect(result.data.token, 'token');
  });

  test('should throw Exception on error', () async {
    when(
      () => mockDio.post(any(), data: any(named: 'data')),
    ).thenThrow(Exception('error'));
    expect(() => datasource.login(email: 'a', password: 'b'), throwsException);
  });
}
