// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetAllTransaction)
const getAllTransactionProvider = GetAllTransactionProvider._();

final class GetAllTransactionProvider
    extends $AsyncNotifierProvider<GetAllTransaction, TransactionResponse> {
  const GetAllTransactionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllTransactionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllTransactionHash();

  @$internal
  @override
  GetAllTransaction create() => GetAllTransaction();
}

String _$getAllTransactionHash() => r'79e05a8d0e2c87ee42bd63e6da7f02ee36163894';

abstract class _$GetAllTransaction extends $AsyncNotifier<TransactionResponse> {
  FutureOr<TransactionResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<TransactionResponse>, TransactionResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TransactionResponse>, TransactionResponse>,
              AsyncValue<TransactionResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
