import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_device_provider.g.dart';

@riverpod
class GetAllDevice extends _$GetAllDevice {
  @override
  FutureOr<DeviceResponse> build() async {
    final usecase = ref.read(getAllDeviceUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
