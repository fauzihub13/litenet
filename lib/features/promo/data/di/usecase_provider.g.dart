// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPromoUsecase)
const getPromoUsecaseProvider = GetPromoUsecaseProvider._();

final class GetPromoUsecaseProvider
    extends
        $FunctionalProvider<GetPromoUsecase, GetPromoUsecase, GetPromoUsecase>
    with $Provider<GetPromoUsecase> {
  const GetPromoUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPromoUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPromoUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetPromoUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPromoUsecase create(Ref ref) {
    return getPromoUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPromoUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPromoUsecase>(value),
    );
  }
}

String _$getPromoUsecaseHash() => r'e9851471e09d8162a08943287aada018fe2fb450';
