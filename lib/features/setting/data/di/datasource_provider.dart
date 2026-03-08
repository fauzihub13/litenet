import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
SettingDatasource settingDatasource(Ref ref) {
  return SettingDatasourceImpl(httpClient: ref.read(dioProvider));
}
