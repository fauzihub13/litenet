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

  group('QuotaDatasourceImpl', () {
    group('getAllQuotas', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Quotas fetched',
        'data': [
          {
            'id': 'PLAN-001',
            'name': 'Unlimited 100GB',
            'description': '100GB FUP Package',
            'capacity': '100GB',
            'price': 150000,
            'price_formatted': 'Rp 150.000',
            'type': 'unlimited',
            'slug': 'unlimited-100gb',
          }
        ]
      };

      test('should return QuotaResponse when response is successful (200)', () async {
        // arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tResponsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final result = await datasource.getAllQuotas();

        // assert
        expect(result.success, true);
        expect(result.data.first.id, 'PLAN-001');
      });
    });

    group('getDetailQuota', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Quota detail fetched',
        'data': {
          'id': 'PLAN-001',
          'name': 'Unlimited 100GB',
          'description': '100GB FUP Package',
          'capacity': '100GB',
          'price': 150000,
          'price_formatted': 'Rp 150.000',
          'type': 'unlimited',
          'slug': 'unlimited-100gb',
        }
      };

      test('should return DetailQuotaResponse when response is successful (200)', () async {
        // arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tResponsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final result = await datasource.getDetailQuota(id: 'PLAN-001');

        // assert
        expect(result.success, true);
        expect(result.data.id, 'PLAN-001');
      });
    });

    group('checkPromoCode', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Promo valid',
        'data': {
          'id': 'PROMO-001',
          'promo_code': 'WELCOME2026',
          'discount': 50000,
          'discount_type': 'nominal',
          'description': 'Welcome discount',
        }
      };

      test('should return CheckPromoResponse when response is successful (200)', () async {
        // arrange
        when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
          (_) async => Response(
            data: tResponsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final result = await datasource.checkPromoCode(
          dataPlanId: 'PROMO-001',
          promoCode: 'WELCOME2026',
        );

        // assert
        expect(result.success, true);
        expect(result.data.promoCode, 'WELCOME2026');
      });
    });
  });
}
