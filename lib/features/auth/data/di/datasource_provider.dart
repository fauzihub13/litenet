import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/auth/data/datasources/login_datasource.dart';
import 'package:litenet/features/auth/data/datasources/otp_datasource.dart';
import 'package:litenet/features/auth/data/datasources/register_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
LoginDatasource loginDatasource(Ref ref) {
  return LoginDatasourceImpl(httpClient: ref.read(dioProvider));
}

@riverpod
RegisterDatasource registerDatasource(Ref ref) {
  return RegisterDatasourceImpl(httpClient: ref.read(dioProvider));
}

@riverpod
OTPDatasource otpDatasource(Ref ref) {
  return OTPDatasourceImpl(httpClient: ref.read(dioProvider));
}
