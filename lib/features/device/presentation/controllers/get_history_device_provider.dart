import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_history_device_provider.g.dart';

@riverpod
class GetHistoryDevice extends _$GetHistoryDevice {
  @override
  FutureOr<HistoryDeviceResponse?> build({required String deviceId}) async {
    return null;
  }

  Future<void> fetchHistoryDevice(String deviceId) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getHistoryDeviceUsecaseProvider);
    final result = await usecase.call(deviceId: deviceId);

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

