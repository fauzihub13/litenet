import 'package:dio/dio.dart';
import 'package:litenet/features/setting/data/mappers/logout_mapper.dart';
import 'package:litenet/features/setting/data/models/logout_model.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';

abstract class SettingDatasource {
  Future<LogoutResponse> logout();
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
}
