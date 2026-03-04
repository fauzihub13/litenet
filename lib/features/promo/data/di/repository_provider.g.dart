// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(promoRepository)
const promoRepositoryProvider = PromoRepositoryProvider._();

final class PromoRepositoryProvider
    extends
        $FunctionalProvider<PromoRepository, PromoRepository, PromoRepository>
    with $Provider<PromoRepository> {
  const PromoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'promoRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$promoRepositoryHash();

  @$internal
  @override
  $ProviderElement<PromoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PromoRepository create(Ref ref) {
    return promoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PromoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PromoRepository>(value),
    );
  }
}

String _$promoRepositoryHash() => r'85731d2f94668451aa9fef8248279f12e4a291d6';
