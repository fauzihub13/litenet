import 'package:dio/dio.dart';
import 'package:litenet/features/auth/data/mappers/login_mapper.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';

abstract class LoginDatasource {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}

class LoginDatasourceImpl extends LoginDatasource {
  final Dio httpClient;

  LoginDatasourceImpl({required this.httpClient});

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
    print(response.data);

    final data = LoginResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
