// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingDatasource)
const settingDatasourceProvider = SettingDatasourceProvider._();

final class SettingDatasourceProvider
    extends
        $FunctionalProvider<
          SettingDatasource,
          SettingDatasource,
          SettingDatasource
        >
    with $Provider<SettingDatasource> {
  const SettingDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingDatasourceHash();

  @$internal
  @override
  $ProviderElement<SettingDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingDatasource create(Ref ref) {
    return settingDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingDatasource>(value),
    );
  }
}

String _$settingDatasourceHash() => r'ea3b3aa19727d7effb586ac82545d872ac9d9d2b';
