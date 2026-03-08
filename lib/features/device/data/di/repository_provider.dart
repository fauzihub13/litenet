import 'package:litenet/features/device/data/di/datasource_provider.dart';
import 'package:litenet/features/device/data/repositories/device_repository_impl.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
DeviceRepository deviceRepository(Ref ref) {
  return DeviceRepositoryImpl(
    deviceDatasource: ref.read(deviceDatasourceProvider),
  );
}
