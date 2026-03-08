// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginDatasource)
const loginDatasourceProvider = LoginDatasourceProvider._();

final class LoginDatasourceProvider
    extends
        $FunctionalProvider<LoginDatasource, LoginDatasource, LoginDatasource>
    with $Provider<LoginDatasource> {
  const LoginDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginDatasourceHash();

  @$internal
  @override
  $ProviderElement<LoginDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginDatasource create(Ref ref) {
    return loginDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginDatasource>(value),
    );
  }
}

String _$loginDatasourceHash() => r'a73423faa41f9379a8bc89076b85c32987d02ec9';

@ProviderFor(registerDatasource)
const registerDatasourceProvider = RegisterDatasourceProvider._();

final class RegisterDatasourceProvider
    extends
        $FunctionalProvider<
          RegisterDatasource,
          RegisterDatasource,
          RegisterDatasource
        >
    with $Provider<RegisterDatasource> {
  const RegisterDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerDatasourceHash();

  @$internal
  @override
  $ProviderElement<RegisterDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterDatasource create(Ref ref) {
    return registerDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterDatasource>(value),
    );
  }
}

String _$registerDatasourceHash() =>
    r'0f57497c4df70d04a39250d94a6a036aea224032';

@ProviderFor(otpDatasource)
const otpDatasourceProvider = OtpDatasourceProvider._();

final class OtpDatasourceProvider
    extends $FunctionalProvider<OTPDatasource, OTPDatasource, OTPDatasource>
    with $Provider<OTPDatasource> {
  const OtpDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'otpDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$otpDatasourceHash();

  @$internal
  @override
  $ProviderElement<OTPDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OTPDatasource create(Ref ref) {
    return otpDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OTPDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OTPDatasource>(value),
    );
  }
}

String _$otpDatasourceHash() => r'5e850239beb4b0eb7388093b009c6c90d8dbf397';
