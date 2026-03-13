// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetHistoryDevice)
const getHistoryDeviceProvider = GetHistoryDeviceFamily._();

final class GetHistoryDeviceProvider
    extends $AsyncNotifierProvider<GetHistoryDevice, HistoryDeviceResponse> {
  const GetHistoryDeviceProvider._({
    required GetHistoryDeviceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getHistoryDeviceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getHistoryDeviceHash();

  @override
  String toString() {
    return r'getHistoryDeviceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetHistoryDevice create() => GetHistoryDevice();

  @override
  bool operator ==(Object other) {
    return other is GetHistoryDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getHistoryDeviceHash() => r'c16dacdce139e268ddd0d66ad78589289b13da39';

final class GetHistoryDeviceFamily extends $Family
    with
        $ClassFamilyOverride<
          GetHistoryDevice,
          AsyncValue<HistoryDeviceResponse>,
          HistoryDeviceResponse,
          FutureOr<HistoryDeviceResponse>,
          String
        > {
  const GetHistoryDeviceFamily._()
    : super(
        retry: null,
        name: r'getHistoryDeviceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetHistoryDeviceProvider call({required String deviceId}) =>
      GetHistoryDeviceProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'getHistoryDeviceProvider';
}

abstract class _$GetHistoryDevice
    extends $AsyncNotifier<HistoryDeviceResponse> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  FutureOr<HistoryDeviceResponse> build({required String deviceId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(deviceId: _$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<HistoryDeviceResponse>, HistoryDeviceResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<HistoryDeviceResponse>,
                HistoryDeviceResponse
              >,
              AsyncValue<HistoryDeviceResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
