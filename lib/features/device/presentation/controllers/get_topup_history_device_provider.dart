import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_topup_history_device_provider.g.dart';

@riverpod
class GetTopupHistoryDevice extends _$GetTopupHistoryDevice {
  @override
  FutureOr<TopupHistoryDeviceResponse> build({required String deviceId}) async {
    final usecase = ref.read(getTopupHistoryDeviceUsecaseProvider);
    final result = await usecase.call(deviceId: deviceId);

    return result.fold((failure) => throw failure, (data) => data);
  }
}
