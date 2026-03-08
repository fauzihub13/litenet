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
        isAutoDispose: true,
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

String _$quotaDatasourceHash() => r'4b1c15fdefc9f0ea24ea080d0fa03d3acb61dd73';

@ProviderFor(transactionDatasource)
const transactionDatasourceProvider = TransactionDatasourceProvider._();

final class TransactionDatasourceProvider
    extends
        $FunctionalProvider<
          TransactionDatasource,
          TransactionDatasource,
          TransactionDatasource
        >
    with $Provider<TransactionDatasource> {
  const TransactionDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionDatasourceHash();

  @$internal
  @override
  $ProviderElement<TransactionDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionDatasource create(Ref ref) {
    return transactionDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionDatasource>(value),
    );
  }
}

String _$transactionDatasourceHash() =>
    r'4d396fa19e64954766dc351a4938f1d0e56e5140';
