// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_faq_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetFAQ)
const getFAQProvider = GetFAQProvider._();

final class GetFAQProvider extends $AsyncNotifierProvider<GetFAQ, FAQResponse> {
  const GetFAQProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFAQProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFAQHash();

  @$internal
  @override
  GetFAQ create() => GetFAQ();
}

String _$getFAQHash() => r'ae9931b623f65020376fd4d4d8b28f8fa7ee391e';

abstract class _$GetFAQ extends $AsyncNotifier<FAQResponse> {
  FutureOr<FAQResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<FAQResponse>, FAQResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FAQResponse>, FAQResponse>,
              AsyncValue<FAQResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
