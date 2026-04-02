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

  group('AuthDatasourceImpl', () {
    group('register', () {
      final tResponsePayload = {
        'success': true,
        'message': 'Registration successful',
        'data': {'user_id': 'USR-123'},
      };

      test(
        'should return RegisterResponse when response is successful (200)',
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
          final result = await datasource.register(
            name: 'Test User',
            email: 'test@example.com',
            password: 'password123',
            passwordConfirmation: 'password123',
            phoneNumber: '08123456789',
          );

          // assert
          expect(result.success, true);
          expect(result.message, 'Registration successful');
          verify(() => mockDio.post(any(), data: any(named: 'data'))).called(1);
        },
      );

      test('should throw Exception when dio throws', () async {
        // arrange
        when(
          () => mockDio.post(any(), data: any(named: 'data')),
        ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

        // act
        final call = datasource.register;

        // assert
        expect(
          () => call(
            name: 'Test',
            email: 'a',
            password: 'b',
            passwordConfirmation: 'b',
            phoneNumber: '123',
          ),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('login', () {
      final tLoginResponse = {
        'success': true,
        'message': 'Login successful',
        'data': {
          'user': {
            'id': 'USR-001',
            'name': 'Test User',
            'email': 'test@example.com',
          },
          'is_verified': true,
          'token': 'valid_token',
        },
      };

      test('should return LoginResponseModel on success', () async {
        // arrange
        when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
          (_) async => Response(
            data: tLoginResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // act
        final result = await datasource.login(
          email: 'test@example.com',
          password: 'password123',
        );

        // assert
        expect(result.success, true);
        expect(result.data.token, 'valid_token');
      });
    });

    group('resendOTP', () {
      final tOTPResponse = {
        'success': true,
        'message': 'OTP sent',
        'data': {
          'user': {'id': 'USR-001'},
          'is_verified': false,
          'token': 'some_token',
        },
      };

      test(
        'should return OTPResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
            (_) async => Response(
              data: tOTPResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.resendOTP(email: 'test@example.com');

          // assert
          expect(result.success, true);
          expect(result.message, 'OTP sent');
        },
      );
    });

    group('verifyOTP', () {
      final tOTPResponse = {
        'success': true,
        'message': 'OTP verified',
        'data': {
          'user': {'id': 'USR-001'},
          'is_verified': true,
          'token': 'valid_token',
        },
      };

      test(
        'should return OTPResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
            (_) async => Response(
              data: tOTPResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.verifyOTP(
            email: 'test@example.com',
            otp: '123456',
          );

          // assert
          expect(result.success, true);
          expect(result.message, 'OTP verified');
        },
      );
    });

    group('getSummary', () {
      final tSummaryResponse = {
        'success': true,
        'message': 'Summary fetched',
        'data': {
          'total_device': 10,
          'online_device': 7,
          'offline_device': 2,
          'inactive_device': 1,
        },
      };

      test(
        'should return SummaryResponseModel when response is successful',
        () async {
          // arrange
          when(() => mockDio.get(any())).thenAnswer(
            (_) async => Response(
              data: tSummaryResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // act
          final result = await datasource.getSummary();

          // assert
          expect(result.success, true);
          expect(result.data.totalDevice, 10);
        },
      );
    });
  });
}
