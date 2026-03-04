import 'package:dio/dio.dart';
import 'package:litenet/features/setting/data/mappers/change_password_mapper.dart';
import 'package:litenet/features/setting/data/mappers/faq_mapper.dart';
import 'package:litenet/features/setting/data/mappers/logout_mapper.dart';
import 'package:litenet/features/setting/data/mappers/privacy_and_policy_mapper.dart';
import 'package:litenet/features/setting/data/mappers/profile_mapper.dart';
import 'package:litenet/features/setting/data/models/change_password_model.dart';
import 'package:litenet/features/setting/data/models/faq_model.dart';
import 'package:litenet/features/setting/data/models/logout_model.dart';
import 'package:litenet/features/setting/data/models/privacy_and_policy_model.dart';
import 'package:litenet/features/setting/data/models/profile_model.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';

abstract class SettingDatasource {
  Future<LogoutResponse> logout();
  Future<ProfileResponse> getProfile();
  Future<ProfileResponse> changeProfile({
    required String name,
    required String email,
    required String phoneNumber,
  });
  Future<ChangePasswordResponse> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
  Future<FAQResponse> getFAQ();
  Future<PrivacyAndPolicyResponse> getPrivacyAndPolicy();
}

class SettingDatasourceImpl extends SettingDatasource {
  final Dio httpClient;

  SettingDatasourceImpl({required this.httpClient});

  @override
  Future<LogoutResponse> logout() async {
    String url = '/logout';
    final response = await httpClient.post(url);

    final data = LogoutResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<ProfileResponse> getProfile() async {
    String url = '/me';
    final response = await httpClient.get(url);

    final data = ProfileResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<ProfileResponse> changeProfile({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    String url = '/change-profile';
    final response = await httpClient.put(
      url,
      data: {"name": name, "email": email, "phone_number": phoneNumber},
    );

    final data = ProfileResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<ChangePasswordResponse> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    String url = '/change-password';
    final response = await httpClient.put(
      url,
      data: {
        "current_password": oldPassword,
        "new_password": newPassword,
        "new_password_confirmation": confirmNewPassword,
      },
    );

    final data = ChangePasswordResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<FAQResponse> getFAQ() async {
    String url = '/faqs';
    final response = await httpClient.get(url);

    final data = FAQResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<PrivacyAndPolicyResponse> getPrivacyAndPolicy() async {
    String url = '/privacy-policies';
    final response = await httpClient.get(url);

    final data = PrivacyAndPolicyResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
