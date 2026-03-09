// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_summary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetSummary)
const getSummaryProvider = GetSummaryProvider._();

final class GetSummaryProvider
    extends $AsyncNotifierProvider<GetSummary, SummaryResponse> {
  const GetSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSummaryHash();

  @$internal
  @override
  GetSummary create() => GetSummary();
}

String _$getSummaryHash() => r'ed2790b1f02713277982cbe33bae5f0e41a32a7b';

abstract class _$GetSummary extends $AsyncNotifier<SummaryResponse> {
  FutureOr<SummaryResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SummaryResponse>, SummaryResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SummaryResponse>, SummaryResponse>,
              AsyncValue<SummaryResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
