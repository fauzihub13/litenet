// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_quota_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetAllQuota)
const getAllQuotaProvider = GetAllQuotaProvider._();

final class GetAllQuotaProvider
    extends $AsyncNotifierProvider<GetAllQuota, QuotaResponse> {
  const GetAllQuotaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllQuotaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllQuotaHash();

  @$internal
  @override
  GetAllQuota create() => GetAllQuota();
}

String _$getAllQuotaHash() => r'ce13592fa29000995c02833d04a1adc9df71b63e';

abstract class _$GetAllQuota extends $AsyncNotifier<QuotaResponse> {
  FutureOr<QuotaResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<QuotaResponse>, QuotaResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<QuotaResponse>, QuotaResponse>,
              AsyncValue<QuotaResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
