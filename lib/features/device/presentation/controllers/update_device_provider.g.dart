// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpdateDevice)
const updateDeviceProvider = UpdateDeviceProvider._();

final class UpdateDeviceProvider
    extends $AsyncNotifierProvider<UpdateDevice, ClaimDeviceResponse?> {
  const UpdateDeviceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateDeviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateDeviceHash();

  @$internal
  @override
  UpdateDevice create() => UpdateDevice();
}

String _$updateDeviceHash() => r'ee1ff92d1023c2b5fa6a6cde8fedb11060bf6e5d';

abstract class _$UpdateDevice extends $AsyncNotifier<ClaimDeviceResponse?> {
  FutureOr<ClaimDeviceResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<ClaimDeviceResponse?>, ClaimDeviceResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ClaimDeviceResponse?>,
                ClaimDeviceResponse?
              >,
              AsyncValue<ClaimDeviceResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
