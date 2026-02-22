// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Login)
const loginProvider = LoginProvider._();

final class LoginProvider
    extends $AsyncNotifierProvider<Login, LoginResponse?> {
  const LoginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @$internal
  @override
  Login create() => Login();
}

String _$loginHash() => r'a27b402c2839817a9eb27ad857eb00f863d3262a';

abstract class _$Login extends $AsyncNotifier<LoginResponse?> {
  FutureOr<LoginResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LoginResponse?>, LoginResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LoginResponse?>, LoginResponse?>,
              AsyncValue<LoginResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
