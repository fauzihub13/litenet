// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_promo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetPromo)
const getPromoProvider = GetPromoProvider._();

final class GetPromoProvider
    extends $AsyncNotifierProvider<GetPromo, PromoResponse> {
  const GetPromoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPromoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPromoHash();

  @$internal
  @override
  GetPromo create() => GetPromo();
}

String _$getPromoHash() => r'5d8d0e3aafd91ff24fbbf42b8296071331bb1884';

abstract class _$GetPromo extends $AsyncNotifier<PromoResponse> {
  FutureOr<PromoResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<PromoResponse>, PromoResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PromoResponse>, PromoResponse>,
              AsyncValue<PromoResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
