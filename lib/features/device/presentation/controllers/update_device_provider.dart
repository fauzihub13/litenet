import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_device_provider.g.dart';

@riverpod
class UpdateDevice extends _$UpdateDevice {
  @override
  FutureOr<ClaimDeviceResponse?> build() async {
    return null;
  }

  Future<void> updateDevice({
    required String deviceId,
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
    required bool status,
  }) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(updateDeviceUsecaseProvider);
    final result = await usecase.call(
      deviceId: deviceId,
      name: name,
      address: address,
      kitSerialNumber: kitSerialNumber,
      nodelink: nodelink,
      latitude: latitude,
      longitude: longitude,
      status: status,
    );

    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
