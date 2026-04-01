import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/promo/data/datasources/promo_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late PromoDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = PromoDatasourceImpl(httpClient: mockDio);
  });

  test('should return PromoResponse when response is successful', () async {
    final responsePayload = {'success': true, 'message': 'ok', 'data': []};
    when(() => mockDio.get(any())).thenAnswer(
      (_) async => Response(
        data: responsePayload,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await datasource.getPromo();
    expect(result.success, true);
    expect(result.message, 'ok');
  });

  test('should throw Exception on error', () async {
    when(() => mockDio.get(any())).thenThrow(Exception('error'));
    expect(() => datasource.getPromo(), throwsException);
  });
}
