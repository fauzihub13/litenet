// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceDatasource)
const deviceDatasourceProvider = DeviceDatasourceProvider._();

final class DeviceDatasourceProvider
    extends
        $FunctionalProvider<
          DeviceDatasource,
          DeviceDatasource,
          DeviceDatasource
        >
    with $Provider<DeviceDatasource> {
  const DeviceDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceDatasourceHash();

  @$internal
  @override
  $ProviderElement<DeviceDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceDatasource create(Ref ref) {
    return deviceDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceDatasource>(value),
    );
  }
}

String _$deviceDatasourceHash() => r'df225a7264aa07c9fa0450616d46089762753423';
