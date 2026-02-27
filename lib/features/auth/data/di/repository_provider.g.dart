// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginRepository)
const loginRepositoryProvider = LoginRepositoryProvider._();

final class LoginRepositoryProvider
    extends
        $FunctionalProvider<LoginRepository, LoginRepository, LoginRepository>
    with $Provider<LoginRepository> {
  const LoginRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginRepositoryHash();

  @$internal
  @override
  $ProviderElement<LoginRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginRepository create(Ref ref) {
    return loginRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginRepository>(value),
    );
  }
}

String _$loginRepositoryHash() => r'30ee18c7d48021ba1386f39ece162ccb7f9ebdba';

@ProviderFor(registerRepository)
const registerRepositoryProvider = RegisterRepositoryProvider._();

final class RegisterRepositoryProvider
    extends
        $FunctionalProvider<
          RegisterRepository,
          RegisterRepository,
          RegisterRepository
        >
    with $Provider<RegisterRepository> {
  const RegisterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerRepositoryHash();

  @$internal
  @override
  $ProviderElement<RegisterRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterRepository create(Ref ref) {
    return registerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterRepository>(value),
    );
  }
}

String _$registerRepositoryHash() =>
    r'9505d875763b0a39b149872858969f36b7dd52e7';

@ProviderFor(otpRepository)
const otpRepositoryProvider = OtpRepositoryProvider._();

final class OtpRepositoryProvider
    extends $FunctionalProvider<OTPRepository, OTPRepository, OTPRepository>
    with $Provider<OTPRepository> {
  const OtpRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'otpRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$otpRepositoryHash();

  @$internal
  @override
  $ProviderElement<OTPRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OTPRepository create(Ref ref) {
    return otpRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OTPRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OTPRepository>(value),
    );
  }
}

String _$otpRepositoryHash() => r'f5926641e56cd365804a2af3bdc3542361420bbe';
