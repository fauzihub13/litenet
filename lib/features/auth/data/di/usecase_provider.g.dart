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
        isAutoDispose: true,
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

String _$loginUsecaseHash() => r'c3d8aa6cfcd7b225a098ae846916a06508abea24';

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
        isAutoDispose: true,
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

String _$registerUsecaseHash() => r'cc02c796671729935b59c657d1b1cc71bfa1a4ca';

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
        isAutoDispose: true,
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

String _$verifyOTPUsecaseHash() => r'2de64d1bd8ab3e5f2b7ec9fc65788598418d41be';

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
        isAutoDispose: true,
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

String _$resendOTPUsecaseHash() => r'dbb2beb0778a709c11733ae2adb12471748052e6';
