// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginUsecase)
const loginUsecaseProvider = LoginUsecaseProvider._();

final class LoginUsecaseProvider
    extends $FunctionalProvider<LoginUsecase, LoginUsecase, LoginUsecase>
    with $Provider<LoginUsecase> {
  const LoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUsecase create(Ref ref) {
    return loginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUsecase>(value),
    );
  }
}

String _$loginUsecaseHash() => r'190cbae45e6f55b40b79a392827f83bae182543a';

@ProviderFor(registerUsecase)
const registerUsecaseProvider = RegisterUsecaseProvider._();

final class RegisterUsecaseProvider
    extends
        $FunctionalProvider<RegisterUsecase, RegisterUsecase, RegisterUsecase>
    with $Provider<RegisterUsecase> {
  const RegisterUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerUsecaseHash();

  @$internal
  @override
  $ProviderElement<RegisterUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterUsecase create(Ref ref) {
    return registerUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterUsecase>(value),
    );
  }
}

String _$registerUsecaseHash() => r'4d5bdd21f5c6269e8d0350218588aab0bf343b3f';

@ProviderFor(verifyOTPUsecase)
const verifyOTPUsecaseProvider = VerifyOTPUsecaseProvider._();

final class VerifyOTPUsecaseProvider
    extends
        $FunctionalProvider<
          VerifyOTPUsecase,
          VerifyOTPUsecase,
          VerifyOTPUsecase
        >
    with $Provider<VerifyOTPUsecase> {
  const VerifyOTPUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyOTPUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyOTPUsecaseHash();

  @$internal
  @override
  $ProviderElement<VerifyOTPUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VerifyOTPUsecase create(Ref ref) {
    return verifyOTPUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerifyOTPUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerifyOTPUsecase>(value),
    );
  }
}

String _$verifyOTPUsecaseHash() => r'adf8dbed613a6c55fe186474572f995cb5fa0bb7';

@ProviderFor(resendOTPUsecase)
const resendOTPUsecaseProvider = ResendOTPUsecaseProvider._();

final class ResendOTPUsecaseProvider
    extends
        $FunctionalProvider<
          ResendOTPUsecase,
          ResendOTPUsecase,
          ResendOTPUsecase
        >
    with $Provider<ResendOTPUsecase> {
  const ResendOTPUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resendOTPUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resendOTPUsecaseHash();

  @$internal
  @override
  $ProviderElement<ResendOTPUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ResendOTPUsecase create(Ref ref) {
    return resendOTPUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResendOTPUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResendOTPUsecase>(value),
    );
  }
}

String _$resendOTPUsecaseHash() => r'3e71b739b222e71b7da4df4f795f066e9c393714';
