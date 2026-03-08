// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetDetailTransaction)
const getDetailTransactionProvider = GetDetailTransactionFamily._();

final class GetDetailTransactionProvider
    extends
        $AsyncNotifierProvider<
          GetDetailTransaction,
          DetailTransactionResponse
        > {
  const GetDetailTransactionProvider._({
    required GetDetailTransactionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getDetailTransactionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDetailTransactionHash();

  @override
  String toString() {
    return r'getDetailTransactionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetDetailTransaction create() => GetDetailTransaction();

  @override
  bool operator ==(Object other) {
    return other is GetDetailTransactionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDetailTransactionHash() =>
    r'79bdacb9bacac7257bfd40d4c0e81702d411437e';

final class GetDetailTransactionFamily extends $Family
    with
        $ClassFamilyOverride<
          GetDetailTransaction,
          AsyncValue<DetailTransactionResponse>,
          DetailTransactionResponse,
          FutureOr<DetailTransactionResponse>,
          String
        > {
  const GetDetailTransactionFamily._()
    : super(
        retry: null,
        name: r'getDetailTransactionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDetailTransactionProvider call({required String orderId}) =>
      GetDetailTransactionProvider._(argument: orderId, from: this);

  @override
  String toString() => r'getDetailTransactionProvider';
}

abstract class _$GetDetailTransaction
    extends $AsyncNotifier<DetailTransactionResponse> {
  late final _$args = ref.$arg as String;
  String get orderId => _$args;

  FutureOr<DetailTransactionResponse> build({required String orderId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(orderId: _$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<DetailTransactionResponse>,
              DetailTransactionResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DetailTransactionResponse>,
                DetailTransactionResponse
              >,
              AsyncValue<DetailTransactionResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
