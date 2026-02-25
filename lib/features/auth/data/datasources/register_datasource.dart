import 'package:dio/dio.dart';
import 'package:litenet/features/auth/data/mappers/register_mapper.dart';
import 'package:litenet/features/auth/data/models/register_model.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';

abstract class RegisterDatasource {
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  });
}

class RegisterDatasourceImpl extends RegisterDatasource {
  final Dio httpClient;

  RegisterDatasourceImpl({required this.httpClient});

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
