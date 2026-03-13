import 'package:litenet/features/device/data/di/repository_provider.dart';
import 'package:litenet/features/device/domain/usecases/claim_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_all_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_detail_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_history_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/get_topup_hisotry_device_usecase.dart';
import 'package:litenet/features/device/domain/usecases/update_device_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
ClaimDeviceUsecase claimDeviceUsecase(Ref ref) {
  return ClaimDeviceUsecase(ref.read(deviceRepositoryProvider));
}

@riverpod
GetAllDeviceUsecase getAllDeviceUsecase(Ref ref) {
  return GetAllDeviceUsecase(ref.read(deviceRepositoryProvider));
}

@riverpod
GetDetailDeviceUsecase getDetailDeviceUsecase(Ref ref) {
  return GetDetailDeviceUsecase(ref.read(deviceRepositoryProvider));
}

@riverpod
GetTopupHistoryDeviceUsecase getTopupHistoryDeviceUsecase(Ref ref) {
  return GetTopupHistoryDeviceUsecase(ref.read(deviceRepositoryProvider));
}

@riverpod
UpdateDeviceUsecase updateDeviceUsecase(Ref ref) {
  return UpdateDeviceUsecase(ref.read(deviceRepositoryProvider));
}

@riverpod
GetHistoryDeviceUsecase getHistoryDeviceUsecase(Ref ref) {
  return GetHistoryDeviceUsecase(ref.read(deviceRepositoryProvider));
}
