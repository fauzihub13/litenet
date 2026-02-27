// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingRepository)
const settingRepositoryProvider = SettingRepositoryProvider._();

final class SettingRepositoryProvider
    extends
        $FunctionalProvider<
          SettingRepository,
          SettingRepository,
          SettingRepository
        >
    with $Provider<SettingRepository> {
  const SettingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingRepository create(Ref ref) {
    return settingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingRepository>(value),
    );
  }
}

String _$settingRepositoryHash() => r'8a2ace8305b2773dce970736b82aece94448655f';
