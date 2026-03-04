import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/claim_device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'claim_device_provider.g.dart';

@riverpod
class ClaimDevice extends _$ClaimDevice {
  @override
  FutureOr<ClaimDeviceResponse?> build() async {
    return null;
  }

  Future<void> claimDevice({
    required String name,
    required String address,
    required String kitSerialNumber,
    required String nodelink,
    required double latitude,
    required double longitude,
  }) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(claimDeviceUsecaseProvider);
    final result = await usecase.call(
      name: name,
      address: address,
      kitSerialNumber: kitSerialNumber,
      nodelink: nodelink,
      latitude: latitude,
      longitude: longitude,
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
