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

  test('should return RegisterResponse when response is successful', () async {
    final responsePayload = {
      'success': true,
      'message': 'ok',
      'data': {'user_id': '123'},
    };
    when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response(
        data: responsePayload,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await datasource.register(
      name: 'Test',
      email: 'a',
      password: 'b',
      passwordConfirmation: 'b',
      phoneNumber: '123',
    );
    expect(result.success, true);
    expect(result.message, 'ok');
  });

  test('should throw Exception on error', () async {
    when(
      () => mockDio.post(any(), data: any(named: 'data')),
    ).thenThrow(Exception('error'));
    expect(
      () => datasource.register(
        name: 'Test',
        email: 'a',
        password: 'b',
        passwordConfirmation: 'b',
        phoneNumber: '123',
      ),
      throwsException,
    );
  });
}
