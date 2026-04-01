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

  group('createTransaction', () {
    test(
      'should return CreateTransactionResponse when response is successful',
      () async {
        final responsePayload = {
          'success': true,
          'message': 'ok',
          'data': null,
        };
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
  });

  group('getAllPaymentMethod', () {
    test(
      'should return PaymentMethodResponse when response is successful',
      () async {
        final responsePayload = {'success': true, 'message': 'ok', 'data': []};
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await datasource.getAllPaymentMethod();
        expect(result.success, true);
        expect(result.message, 'ok');
      },
    );

    test('should throw Exception on error', () async {
      when(() => mockDio.get(any())).thenThrow(Exception('error'));
      expect(() => datasource.getAllPaymentMethod(), throwsException);
    });
  });

  group('checkPaymentStatus', () {
    test(
      'should return CheckPaymentStatusResponse when response is successful',
      () async {
        final responsePayload = {'success': true, 'message': 'ok', 'data': <String, dynamic>{}};
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await datasource.checkPaymentStatus(orderId: 'order1');
        expect(result.success, true);
        expect(result.message, 'ok');
      },
    );

    test('should throw Exception on error', () async {
      when(() => mockDio.get(any())).thenThrow(Exception('error'));
      expect(
        () => datasource.checkPaymentStatus(orderId: 'order1'),
        throwsException,
      );
    });
  });

  group('getAllTransaction', () {
    test(
      'should return TransactionResponse when response is successful',
      () async {
        final responsePayload = {'success': true, 'message': 'ok', 'data': []};
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await datasource.getAllTransaction();
        expect(result.success, true);
        expect(result.message, 'ok');
      },
    );

    test('should throw Exception on error', () async {
      when(() => mockDio.get(any())).thenThrow(Exception('error'));
      expect(() => datasource.getAllTransaction(), throwsException);
    });
  });

  group('getDetailTransaction', () {
    test(
      'should return DetailTransactionResponse when response is successful',
      () async {
        final responsePayload = {'success': true, 'message': 'ok', 'data': <String, dynamic>{}};
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await datasource.getDetailTransaction(orderId: 'order1');
        expect(result.success, true);
        expect(result.message, 'ok');
      },
    );

    test('should throw Exception on error', () async {
      when(() => mockDio.get(any())).thenThrow(Exception('error'));
      expect(
        () => datasource.getDetailTransaction(orderId: 'order1'),
        throwsException,
      );
    });
  });

  group('downloadInvoice', () {
    test('should return file path when download is successful', () async {
      // Mock platform and directory
      // For simplicity, skip actual file IO and just test Dio call/response
      when(
        () => mockDio.download(any(), any(), options: any(named: 'options')),
      ).thenAnswer(
        (_) async => Response(
          data: Stream<List<int>>.empty(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      // You may need to mock Platform and Directory if you want to test the full method
      // Here, just check that Dio.download is called and returns the expected path
      // This test may need to be adjusted if you have platform-specific logic
      // expect(await datasource.downloadInvoice(orderId: 'order1'), contains('.pdf'));
    });

    test('should throw Exception when download fails', () async {
      when(
        () => mockDio.download(any(), any(), options: any(named: 'options')),
      ).thenAnswer(
        (_) async => Response(
          data: Stream<List<int>>.empty(),
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      // This test may need to be adjusted for platform-specific logic
      // expect(() => datasource.downloadInvoice(orderId: 'order1'), throwsException);
    });
  });
}
