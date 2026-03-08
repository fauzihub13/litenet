// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quotaRepository)
const quotaRepositoryProvider = QuotaRepositoryProvider._();

final class QuotaRepositoryProvider
    extends
        $FunctionalProvider<QuotaRepository, QuotaRepository, QuotaRepository>
    with $Provider<QuotaRepository> {
  const QuotaRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quotaRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quotaRepositoryHash();

  @$internal
  @override
  $ProviderElement<QuotaRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuotaRepository create(Ref ref) {
    return quotaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuotaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuotaRepository>(value),
    );
  }
}

String _$quotaRepositoryHash() => r'33acc10a76c8867c6e889e0772b0148af2a0afbc';

@ProviderFor(transactionRepository)
const transactionRepositoryProvider = TransactionRepositoryProvider._();

final class TransactionRepositoryProvider
    extends
        $FunctionalProvider<
          TransactionRepository,
          TransactionRepository,
          TransactionRepository
        >
    with $Provider<TransactionRepository> {
  const TransactionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionRepositoryHash();

  @$internal
  @override
  $ProviderElement<TransactionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionRepository create(Ref ref) {
    return transactionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionRepository>(value),
    );
  }
}

String _$transactionRepositoryHash() =>
    r'61b22e525e1421d4985d0bf10fcf02772762fd03';
