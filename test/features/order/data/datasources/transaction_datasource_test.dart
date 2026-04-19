import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/order/data/datasources/transaction_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late TransactionDatasourceImpl datasource;
  late Directory tempDir;

  setUp(() {
    mockDio = MockDio();
    tempDir = Directory.systemTemp.createTempSync();
    datasource = TransactionDatasourceImpl(
      httpClient: mockDio,
      injectedDownloadDir: tempDir.path,
    );
  });
  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  group('TransactionDatasourceImpl', () {
    group('createTransaction', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Transaction created successfully',
        'data': {
          'order_id': 'ORD-001',
          'amount': 150000,
          'payment_type': 'bank_transfer',
          'bank': 'BCA',
          'image_url': 'https://example.com/payment.png',
          'va_number': '1234567890123456',
          'expired_at': '2026-04-03T10:00:00Z',
        },
      };

      test(
        'should return CreateTransactionResponse when response is successful (200)',
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
          final result = await datasource.createTransaction(
            deviceId: 'DEV-001',
            dataPlanId: 'PLAN-001',
            paymentMethod: 'bca_va',
            promoCode: 'PROMO',
          );

          // assert
          expect(result.success, true);
          expect(result.data.orderId, 'ORD-001');
          verify(() => mockDio.post(any(), data: any(named: 'data'))).called(1);
        },
      );

      test('should throw DioException when dio throws', () async {
        // arrange
        when(
          () => mockDio.post(any(), data: any(named: 'data')),
        ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

        // act
        final call = datasource.createTransaction;

        // assert
        expect(
          () => call(
            deviceId: 'dev1',
            dataPlanId: 'plan1',
            paymentMethod: 'method1',
            promoCode: 'PROMO',
          ),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('getAllPaymentMethod', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Payment methods fetched',
        'data': [
          {
            'id': 'PM-001',
            'payment_method': 'BCA Virtual Account',
            'payment_type': 'bank_transfer',
            'bank': 'BCA',
            'image_url': 'https://example.com/bca.png',
          },
        ],
      };

      test(
        'should return PaymentMethodResponse when response is successful',
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
          final result = await datasource.getAllPaymentMethod();

          // assert
          expect(result.success, true);
          expect(result.data.first.id, 'PM-001');
        },
      );
    });

    group('checkPaymentStatus', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Status fetched',
        'data': {
          'id': 'PAY-001',
          'user_id': 'USR-001',
          'order_id': 'ORD-001',
          'transaction_status': 'settlement',
          'fraud_status': 'accept',
          'bank': 'BCA',
          'expired_at': '2026-04-03T10:00:00Z',
        },
      };

      test(
        'should return CheckPaymentStatusResponse when response is successful',
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
          final result = await datasource.checkPaymentStatus(
            orderId: 'ORD-001',
          );

          // assert
          expect(result.success, true);
          expect(result.data.transactionStatus, 'settlement');
        },
      );
    });

    group('getAllTransaction', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Transactions fetched',
        'data': [
          {
            'id': 'tr-001',
            'order_id': 'ORD-001',
            'package_name': 'Unlimited 100GB',
            'capacity': '100GB',
            'transaction_status': 'SETTLEMENT',
            'gross_amount': 150000,
            'created_at': '2026-04-02T10:00:00Z',
          },
        ],
      };

      test(
        'should return TransactionResponse when response is successful',
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
          final result = await datasource.getAllTransaction();

          // assert
          expect(result.success, true);
          expect(result.data.first.orderId, 'ORD-001');
        },
      );
    });

    group('getDetailTransaction', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Detail fetched',
        'data': {
          'id': 'TX-001',
          'order_id': 'ORD-001',
          'package_name': 'Unlimited 100GB',
          'capacity': '100GB',
          'transaction_status': 'SETTLEMENT',
          'gross_amount': 150000,
          'bank_code': 'BCA',
          'bank_name': 'BCA Virtual Account',
          'bank_image_url': 'https://example.com/bca.png',
          'va_number': '1234567890123456',
          'created_at': '2026-04-02T10:00:00Z',
          'expired_at': '2026-04-03T10:00:00Z',
        },
      };

      test(
        'should return DetailTransactionResponse when response is successful',
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
          final result = await datasource.getDetailTransaction(
            orderId: 'ORD-001',
          );

          // assert
          expect(result.success, true);
          expect(result.data.orderId, 'ORD-001');
        },
      );
    });

    group('downloadInvoice', () {
      const orderId = '12345';
      final fileUrl = '/transactions/$orderId/invoice';

      test('returns savePath when download is successful', () async {
        final savePath = '${tempDir.path}/$orderId.pdf';

        when(
          () =>
              mockDio.download(fileUrl, any(), options: any(named: 'options')),
        ).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: fileUrl),
          ),
        );

        final result = await datasource.downloadInvoice(
          orderId: orderId,
          injectedDownloadDir: tempDir.path, 
        );

        expect(result, savePath);
        verify(
          () => mockDio.download(
            fileUrl,
            savePath,
            options: any(named: 'options'),
          ),
        ).called(1);
      });
    });
  });
}
