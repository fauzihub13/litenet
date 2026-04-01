import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/auth/data/datasources/auth_datasource.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/auth/data/models/otp_model.dart';
import 'package:litenet/features/auth/data/models/summary_model.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockDio mockDio;
  late AuthDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = AuthDatasourceImpl(httpClient: mockDio);
  });

  group('register', () {
    test(
      'should return RegisterResponse when response is successful',
      () async {
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
      },
    );

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
  });

  group('login', () {
    test('should return ProfileResponse on success', () async {
      final mockData = LoginResponseModel(success: true, message: 'ok');
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(
        () => mockDio.post(any(), data: any(named: 'data')),
      ).thenAnswer((_) async => mockResponse);
      final result = await datasource.login(
        email: 'sadas@gmail.com',
        password: '0929123',
      );
      expect(result.success, true);
      expect(result.message, 'ok');
    });

    test('should throw Exception on error', () async {
      when(
        () => mockDio.post(any(), data: any(named: 'data')),
      ).thenThrow(Exception('error'));
      expect(
        () => datasource.login(email: 'a', password: 'b'),
        throwsException,
      );
    });
  });

  group('resendOTP', () {
    test('should return OTPResponse when response is successful', () async {
      final mockData = OTPResponseModel(success: true, message: 'ok');
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(
        () => mockDio.post(any(), data: any(named: 'data')),
      ).thenAnswer((_) async => mockResponse);
      final result = await datasource.resendOTP(email: 'sadas@gmail.com');
      expect(result.success, true);
      expect(result.message, 'ok');
    });

    test('should throw Exception on error', () async {
      when(
        () => mockDio.post(any(), data: any(named: 'data')),
      ).thenThrow(Exception('error'));
      expect(
        () => datasource.resendOTP(email: 'test@email.com'),
        throwsException,
      );
    });
  });

  group('verifyOTP', () {
    test('should return OTPResponse when response is successful', () async {
      final mockData = OTPResponseModel(success: true, message: 'ok');
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(
        () => mockDio.post(any(), data: any(named: 'data')),
      ).thenAnswer((_) async => mockResponse);
      final result = await datasource.verifyOTP(
        email: 'sadas@gmail.com',
        otp: '123456',
      );
      expect(result.success, true);
      expect(result.message, 'ok');
    });

    test('should throw Exception on error', () async {
      when(
        () => mockDio.post(any(), data: any(named: 'data')),
      ).thenThrow(Exception('error'));
      expect(
        () => datasource.verifyOTP(email: 'test@email.com', otp: '123456'),
        throwsException,
      );
    });
  });

  group('getSummary', () {
    test('should return Summary when response is successful', () async {
      final mockData = SummaryResponseModel(
        success: true,
        message: 'ok',
        data: null,
      );
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(
        () => mockDio.get(any(), data: any(named: 'data')),
      ).thenAnswer((_) async => mockResponse);
      final result = await datasource.getSummary();
      expect(result.success, true);
      expect(result.message, 'ok');
    });

    test('should throw Exception on error', () async {
      when(
        () => mockDio.get(any(), data: any(named: 'data')),
      ).thenThrow(Exception('error'));
      expect(() => datasource.getSummary(), throwsException);
    });
  });
}
