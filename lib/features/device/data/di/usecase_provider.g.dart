// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(claimDeviceUsecase)
const claimDeviceUsecaseProvider = ClaimDeviceUsecaseProvider._();

final class ClaimDeviceUsecaseProvider
    extends
        $FunctionalProvider<
          ClaimDeviceUsecase,
          ClaimDeviceUsecase,
          ClaimDeviceUsecase
        >
    with $Provider<ClaimDeviceUsecase> {
  const ClaimDeviceUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'claimDeviceUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$claimDeviceUsecaseHash();

  @$internal
  @override
  $ProviderElement<ClaimDeviceUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClaimDeviceUsecase create(Ref ref) {
    return claimDeviceUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClaimDeviceUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClaimDeviceUsecase>(value),
    );
  }
}

String _$claimDeviceUsecaseHash() =>
    r'e31a2faa0de6d9aadcd4dec61366f8b5146b385b';
