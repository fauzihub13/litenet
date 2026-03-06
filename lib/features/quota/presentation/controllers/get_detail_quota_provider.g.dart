// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_quota_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetDetailQuota)
const getDetailQuotaProvider = GetDetailQuotaFamily._();

final class GetDetailQuotaProvider
    extends $AsyncNotifierProvider<GetDetailQuota, DetailQuotaResponse> {
  const GetDetailQuotaProvider._({
    required GetDetailQuotaFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getDetailQuotaProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDetailQuotaHash();

  @override
  String toString() {
    return r'getDetailQuotaProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetDetailQuota create() => GetDetailQuota();

  @override
  bool operator ==(Object other) {
    return other is GetDetailQuotaProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDetailQuotaHash() => r'e6b924f0a08f1a6187f7e6f0af523de456412ed3';

final class GetDetailQuotaFamily extends $Family
    with
        $ClassFamilyOverride<
          GetDetailQuota,
          AsyncValue<DetailQuotaResponse>,
          DetailQuotaResponse,
          FutureOr<DetailQuotaResponse>,
          String
        > {
  const GetDetailQuotaFamily._()
    : super(
        retry: null,
        name: r'getDetailQuotaProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDetailQuotaProvider call({required String id}) =>
      GetDetailQuotaProvider._(argument: id, from: this);

  @override
  String toString() => r'getDetailQuotaProvider';
}

abstract class _$GetDetailQuota extends $AsyncNotifier<DetailQuotaResponse> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<DetailQuotaResponse> build({required String id});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(id: _$args);
    final ref =
        this.ref as $Ref<AsyncValue<DetailQuotaResponse>, DetailQuotaResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DetailQuotaResponse>, DetailQuotaResponse>,
              AsyncValue<DetailQuotaResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
