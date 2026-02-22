// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Login)
const loginProvider = LoginFamily._();

final class LoginProvider extends $AsyncNotifierProvider<Login, LoginResponse> {
  const LoginProvider._({
    required LoginFamily super.from,
    required ({String email, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'loginProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @override
  String toString() {
    return r'loginProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  Login create() => Login();

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginHash() => r'a4003f8dcdd85c02c19c8b5b6ad8f299659e87c1';

final class LoginFamily extends $Family
    with
        $ClassFamilyOverride<
          Login,
          AsyncValue<LoginResponse>,
          LoginResponse,
          FutureOr<LoginResponse>,
          ({String email, String password})
        > {
  const LoginFamily._()
    : super(
        retry: null,
        name: r'loginProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoginProvider call({required String email, required String password}) =>
      LoginProvider._(argument: (email: email, password: password), from: this);

  @override
  String toString() => r'loginProvider';
}

abstract class _$Login extends $AsyncNotifier<LoginResponse> {
  late final _$args = ref.$arg as ({String email, String password});
  String get email => _$args.email;
  String get password => _$args.password;

  FutureOr<LoginResponse> build({
    required String email,
    required String password,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(email: _$args.email, password: _$args.password);
    final ref = this.ref as $Ref<AsyncValue<LoginResponse>, LoginResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LoginResponse>, LoginResponse>,
              AsyncValue<LoginResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
