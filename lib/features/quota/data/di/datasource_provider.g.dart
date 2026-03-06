// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quotaDatasource)
const quotaDatasourceProvider = QuotaDatasourceProvider._();

final class QuotaDatasourceProvider
    extends
        $FunctionalProvider<QuotaDatasource, QuotaDatasource, QuotaDatasource>
    with $Provider<QuotaDatasource> {
  const QuotaDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quotaDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quotaDatasourceHash();

  @$internal
  @override
  $ProviderElement<QuotaDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuotaDatasource create(Ref ref) {
    return quotaDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuotaDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuotaDatasource>(value),
    );
  }
}

String _$quotaDatasourceHash() => r'b3b168bada2f991bcfab044eeaf66620f261eccb';
