// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OTP)
const oTPProvider = OTPProvider._();

final class OTPProvider extends $AsyncNotifierProvider<OTP, OTPResponse?> {
  const OTPProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oTPProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oTPHash();

  @$internal
  @override
  OTP create() => OTP();
}

String _$oTPHash() => r'f99600c6e6f2f2e95cb171f0e7045599ae03364e';

abstract class _$OTP extends $AsyncNotifier<OTPResponse?> {
  FutureOr<OTPResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<OTPResponse?>, OTPResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OTPResponse?>, OTPResponse?>,
              AsyncValue<OTPResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
