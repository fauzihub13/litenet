// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetDetailDevice)
const getDetailDeviceProvider = GetDetailDeviceFamily._();

final class GetDetailDeviceProvider
    extends $AsyncNotifierProvider<GetDetailDevice, DetailDeviceResponse> {
  const GetDetailDeviceProvider._({
    required GetDetailDeviceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getDetailDeviceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDetailDeviceHash();

  @override
  String toString() {
    return r'getDetailDeviceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetDetailDevice create() => GetDetailDevice();

  @override
  bool operator ==(Object other) {
    return other is GetDetailDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDetailDeviceHash() => r'f559e40785a38563cd1e720348d08e59da993014';

final class GetDetailDeviceFamily extends $Family
    with
        $ClassFamilyOverride<
          GetDetailDevice,
          AsyncValue<DetailDeviceResponse>,
          DetailDeviceResponse,
          FutureOr<DetailDeviceResponse>,
          String
        > {
  const GetDetailDeviceFamily._()
    : super(
        retry: null,
        name: r'getDetailDeviceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDetailDeviceProvider call({required String deviceId}) =>
      GetDetailDeviceProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'getDetailDeviceProvider';
}

abstract class _$GetDetailDevice extends $AsyncNotifier<DetailDeviceResponse> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  FutureOr<DetailDeviceResponse> build({required String deviceId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(deviceId: _$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<DetailDeviceResponse>, DetailDeviceResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DetailDeviceResponse>,
                DetailDeviceResponse
              >,
              AsyncValue<DetailDeviceResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
