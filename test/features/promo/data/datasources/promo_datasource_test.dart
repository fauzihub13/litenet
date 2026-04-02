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

  group('PromoDatasourceImpl', () {
    group('getPromo', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Promos fetched',
        'data': [
          {
            'id': 'PROMO-001',
            'title': 'Ramadan Sale',
            'description': 'Get 50% discount',
            'image_url': 'https://example.com/promo.png',
            'code': 'RAMADAN50',
            'discount': 50,
            'discount_type': 'percentage',
            'expired_at': '2026-04-30T00:00:00Z',
          }
        ]
      };

      test('should return PromoResponse when response is successful (200)', () async {
        // arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tResponsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final result = await datasource.getPromo();

        // assert
        expect(result.success, true);
        expect(result.data.first.id, 'PROMO-001');
        verify(() => mockDio.get(any())).called(1);
      });

      test('should throw Exception when dio throws', () async {
        // arrange
        when(() => mockDio.get(any()))
            .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

        // act
        final call = datasource.getPromo;

        // assert
        expect(() => call(), throwsA(isA<DioException>()));
      });
    });
  });
}
