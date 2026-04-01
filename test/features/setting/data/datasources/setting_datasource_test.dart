import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:litenet/features/setting/data/models/change_password_model.dart';
import 'package:litenet/features/setting/data/models/faq_model.dart';
import 'package:litenet/features/setting/data/models/privacy_and_policy_model.dart';
import 'package:litenet/features/setting/data/models/profile_model.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockDio mockDio;
  late SettingDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = SettingDatasourceImpl(httpClient: mockDio);
  });

  group('getFAQ', () {
    test('should return FAQResponse on success', () async {
      final mockData = FAQResponseModel(success: true, message: 'ok', data: []);
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);
      final result = await datasource.getFAQ();
      expect(result.success, true);
      expect(result.message, 'ok');
    });
  });

  group('getPrivacyAndPolicy', () {
    test('should return PrivacyAndPolicyResponse on success', () async {
      final mockData = PrivacyAndPolicyResponseModel(
        success: true,
        message: 'ok',
        data: [],
      );
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);
      final result = await datasource.getPrivacyAndPolicy();
      expect(result.success, true);
      expect(result.message, 'ok');
    });
  });

  group('getProfile', () {
    test('should return ProfileResponse on success', () async {
      final mockData = ProfileResponseModel(
        success: true,
        message: 'ok',
        data: null,
      );
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);
      final result = await datasource.getProfile();
      expect(result.success, true);
      expect(result.message, 'ok');
    });
  });

  group('changePassword', () {
    test('should return ChangePasswordResponse on success', () async {
      final mockData = ChangePasswordResponseModel(
        success: true,
        message: 'ok',
      );
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn(mockData.toJson());
      when(
        () => mockDio.put(any(), data: any(named: 'data')),
      ).thenAnswer((_) async => mockResponse);
      final result = await datasource.changePassword(
        oldPassword: 'old',
        newPassword: 'new',
        confirmNewPassword: 'new',
      );
      expect(result.success, true);
      expect(result.message, 'ok');
    });
  });
}
