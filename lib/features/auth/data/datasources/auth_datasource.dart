import 'package:dio/dio.dart';
import 'package:litenet/features/auth/data/mappers/login_mapper.dart';
import 'package:litenet/features/auth/data/mappers/otp_mapper.dart';
import 'package:litenet/features/auth/data/mappers/register_mapper.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/auth/data/models/otp_model.dart';
import 'package:litenet/features/auth/data/models/register_model.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';

abstract class AuthDatasource {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
  Future<OTPResponse> verifyOTP({required String email, required String otp});
  Future<OTPResponse> resendOTP({required String email});
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  });
}

class AuthDatasourceImpl extends AuthDatasource {
  final Dio httpClient;
  AuthDatasourceImpl({required this.httpClient});

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    String url = '/login';
    final response = await httpClient.post(
      url,
      data: {'email': email, 'password': password},
    );

    final data = LoginResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<OTPResponse> resendOTP({required String email}) async {
    String url = '/resend-otp';
    final response = await httpClient.post(url, data: {'email': email});

    final data = OTPResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<OTPResponse> verifyOTP({
    required String email,
    required String otp,
  }) async {
    String url = '/verify-otp';
    final response = await httpClient.post(
      url,
      data: {'email': email, 'otp': otp},
    );

    final data = OTPResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  }) async {
    String url = '/register';
    final response = await httpClient.post(
      url,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'phone_number': phoneNumber,
      },
    );

    final data = RegisterResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
