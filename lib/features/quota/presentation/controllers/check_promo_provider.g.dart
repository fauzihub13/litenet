// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_promo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckPromo)
const checkPromoProvider = CheckPromoProvider._();

final class CheckPromoProvider
    extends $AsyncNotifierProvider<CheckPromo, CheckPromoResponse?> {
  const CheckPromoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkPromoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkPromoHash();

  @$internal
  @override
  CheckPromo create() => CheckPromo();
}

String _$checkPromoHash() => r'155d9eef5275b4dfff5767aec32a07d737e1fa7e';

abstract class _$CheckPromo extends $AsyncNotifier<CheckPromoResponse?> {
  FutureOr<CheckPromoResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<CheckPromoResponse?>, CheckPromoResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CheckPromoResponse?>, CheckPromoResponse?>,
              AsyncValue<CheckPromoResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
