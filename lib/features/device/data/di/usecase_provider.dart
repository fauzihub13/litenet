import 'package:litenet/features/device/data/di/repository_provider.dart';
import 'package:litenet/features/device/domain/usecases/claim_device_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@Riverpod(keepAlive: true)
ClaimDeviceUsecase claimDeviceUsecase(Ref ref) {
  return ClaimDeviceUsecase(ref.read(deviceRepositoryProvider));
}
