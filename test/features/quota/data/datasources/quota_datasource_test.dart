import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/quota/data/datasources/quota_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late QuotaDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = QuotaDatasourceImpl(httpClient: mockDio);
  });

  test('should return QuotaResponse when response is successful', () async {
    final responsePayload = {'success': true, 'message': 'ok', 'data': []};
    when(() => mockDio.get(any())).thenAnswer(
      (_) async => Response(
        data: responsePayload,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await datasource.getAllQuotas();
    expect(result.success, true);
    expect(result.message, 'ok');
  });

  test('should throw Exception on error', () async {
    when(() => mockDio.get(any())).thenThrow(Exception('error'));
    expect(() => datasource.getAllQuotas(), throwsException);
  });
}
