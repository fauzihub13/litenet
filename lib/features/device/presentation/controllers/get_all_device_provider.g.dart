// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetAllDevice)
const getAllDeviceProvider = GetAllDeviceProvider._();

final class GetAllDeviceProvider
    extends $AsyncNotifierProvider<GetAllDevice, DeviceResponse> {
  const GetAllDeviceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllDeviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllDeviceHash();

  @$internal
  @override
  GetAllDevice create() => GetAllDevice();
}

String _$getAllDeviceHash() => r'fb020e9865fae4a7de0379e06cea5ee4686c0a0d';

abstract class _$GetAllDevice extends $AsyncNotifier<DeviceResponse> {
  FutureOr<DeviceResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<DeviceResponse>, DeviceResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DeviceResponse>, DeviceResponse>,
              AsyncValue<DeviceResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
