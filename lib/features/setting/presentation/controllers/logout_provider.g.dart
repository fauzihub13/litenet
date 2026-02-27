// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Logout)
const logoutProvider = LogoutProvider._();

final class LogoutProvider
    extends $AsyncNotifierProvider<Logout, LogoutResponse?> {
  const LogoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutHash();

  @$internal
  @override
  Logout create() => Logout();
}

String _$logoutHash() => r'6c159eb4cba8fa2af8072bf479900d58ffd46555';

abstract class _$Logout extends $AsyncNotifier<LogoutResponse?> {
  FutureOr<LogoutResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LogoutResponse?>, LogoutResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LogoutResponse?>, LogoutResponse?>,
              AsyncValue<LogoutResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
