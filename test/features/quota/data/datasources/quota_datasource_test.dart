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

  group('getAllQuotas', () {
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
  });

  group('getDetailQuota', () {
    test(
      'should return DetailQuotaResponse when response is successful',
      () async {
        final responsePayload = {
          'success': true,
          'message': 'ok',
          'data': <String, dynamic>{},
        };
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await datasource.getDetailQuota(id: 'id1');
        expect(result.success, true);
        expect(result.message, 'ok');
      },
    );

    test('should throw Exception on error', () async {
      when(() => mockDio.get(any())).thenThrow(Exception('error'));
      expect(() => datasource.getDetailQuota(id: 'id1'), throwsException);
    });
  });

  group('checkPromoCode', () {
    test(
      'should return CheckPromoResponse when response is successful',
      () async {
        final responsePayload = {
          'success': true,
          'message': 'ok',
          'data': <String, dynamic>{},
        };
        when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
          (_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await datasource.checkPromoCode(
          dataPlanId: 'plan1',
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
        () =>
            datasource.checkPromoCode(dataPlanId: 'plan1', promoCode: 'PROMO'),
        throwsException,
      );
    });
  });
}
