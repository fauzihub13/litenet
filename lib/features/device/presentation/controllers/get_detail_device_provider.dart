import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/detail_device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_detail_device_provider.g.dart';

@riverpod
class GetDetailDevice extends _$GetDetailDevice {
  @override
  FutureOr<DetailDeviceResponse?> build({required String deviceId}) async {
    return null;
  }

  Future<void> fetchDetailDevice(String deviceId) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getDetailDeviceUsecaseProvider);
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

