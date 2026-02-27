import 'package:litenet/features/setting/data/di/datasource_provider.dart';
import 'package:litenet/features/setting/data/repositories/setting_repository_impl.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
SettingRepository settingRepository(Ref ref) {
  return SettingRepositoryImpl(
    settingDatasource: ref.read(settingDatasourceProvider),
  );
}
