// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(promoDatasource)
const promoDatasourceProvider = PromoDatasourceProvider._();

final class PromoDatasourceProvider
    extends
        $FunctionalProvider<PromoDatasource, PromoDatasource, PromoDatasource>
    with $Provider<PromoDatasource> {
  const PromoDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'promoDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$promoDatasourceHash();

  @$internal
  @override
  $ProviderElement<PromoDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PromoDatasource create(Ref ref) {
    return promoDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PromoDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PromoDatasource>(value),
    );
  }
}

String _$promoDatasourceHash() => r'4245b9f6f9a930ae7a0ee16a5994ac3e1e017b67';
