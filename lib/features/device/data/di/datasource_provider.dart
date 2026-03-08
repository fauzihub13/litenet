import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/device/data/datasources/device_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
DeviceDatasource deviceDatasource(Ref ref) {
  return DeviceDatasourceImpl(httpClient: ref.read(dioProvider));
}
