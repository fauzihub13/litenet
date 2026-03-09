// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_topup_history_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetTopupHistoryDevice)
const getTopupHistoryDeviceProvider = GetTopupHistoryDeviceFamily._();

final class GetTopupHistoryDeviceProvider
    extends
        $AsyncNotifierProvider<
          GetTopupHistoryDevice,
          TopupHistoryDeviceResponse
        > {
  const GetTopupHistoryDeviceProvider._({
    required GetTopupHistoryDeviceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getTopupHistoryDeviceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTopupHistoryDeviceHash();

  @override
  String toString() {
    return r'getTopupHistoryDeviceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetTopupHistoryDevice create() => GetTopupHistoryDevice();

  @override
  bool operator ==(Object other) {
    return other is GetTopupHistoryDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTopupHistoryDeviceHash() =>
    r'867fae48652e924bdfd9be4279b5935ae5255107';

final class GetTopupHistoryDeviceFamily extends $Family
    with
        $ClassFamilyOverride<
          GetTopupHistoryDevice,
          AsyncValue<TopupHistoryDeviceResponse>,
          TopupHistoryDeviceResponse,
          FutureOr<TopupHistoryDeviceResponse>,
          String
        > {
  const GetTopupHistoryDeviceFamily._()
    : super(
        retry: null,
        name: r'getTopupHistoryDeviceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTopupHistoryDeviceProvider call({required String deviceId}) =>
      GetTopupHistoryDeviceProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'getTopupHistoryDeviceProvider';
}

abstract class _$GetTopupHistoryDevice
    extends $AsyncNotifier<TopupHistoryDeviceResponse> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  FutureOr<TopupHistoryDeviceResponse> build({required String deviceId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(deviceId: _$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<TopupHistoryDeviceResponse>,
              TopupHistoryDeviceResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<TopupHistoryDeviceResponse>,
                TopupHistoryDeviceResponse
              >,
              AsyncValue<TopupHistoryDeviceResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
