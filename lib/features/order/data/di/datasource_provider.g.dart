// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: false,
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
    r'664521da19c2a60b4fd99080cee7bce0ee133c67';
