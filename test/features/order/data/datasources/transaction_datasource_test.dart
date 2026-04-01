import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/order/data/datasources/transaction_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late TransactionDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = TransactionDatasourceImpl(httpClient: mockDio);
  });

  test(
    'should return CreateTransactionResponse when response is successful',
    () async {
      final responsePayload = {'success': true, 'message': 'ok', 'data': null};
      when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
        (_) async => Response(
          data: responsePayload,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      );
      expect(result.success, true);
      expect(result.message, 'ok');
    },
  );

  test('should throw Exception on error', () async {
    when(
      () => mockDio.post(any(), data: any(named: 'data')),
    ).thenThrow(Exception('error'));
    expect(
      () => datasource.createTransaction(
        deviceId: 'dev1',
        dataPlanId: 'plan1',
        paymentMethod: 'method1',
        promoCode: 'PROMO',
      ),
      throwsException,
    );
  });
}
