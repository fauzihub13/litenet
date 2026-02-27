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
        isAutoDispose: false,
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

String _$loginDatasourceHash() => r'5c6ea5767269b791b5a3cab16707a111d0a8aab3';

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
        isAutoDispose: false,
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
    r'400858431278cf250e6bc6bd17cbd5d8f9bf044a';

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
        isAutoDispose: false,
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

String _$otpDatasourceHash() => r'c358409364c77f9d49bb9a7f61db240bdc16ecbd';
