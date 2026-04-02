import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_device_provider.g.dart';

@riverpod
class GetAllDevice extends _$GetAllDevice {
  @override
  FutureOr<DeviceResponse?> build() async {
    return null;
  }

  Future<void> fetchAllDevice() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getAllDeviceUsecaseProvider);
    final result = await usecase.call();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
