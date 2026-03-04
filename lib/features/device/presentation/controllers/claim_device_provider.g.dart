// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClaimDevice)
const claimDeviceProvider = ClaimDeviceProvider._();

final class ClaimDeviceProvider
    extends $AsyncNotifierProvider<ClaimDevice, ClaimDeviceResponse?> {
  const ClaimDeviceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'claimDeviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$claimDeviceHash();

  @$internal
  @override
  ClaimDevice create() => ClaimDevice();
}

String _$claimDeviceHash() => r'0fd6d0810ab3fc5fa303209efd81c7f9d73a493b';

abstract class _$ClaimDevice extends $AsyncNotifier<ClaimDeviceResponse?> {
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
