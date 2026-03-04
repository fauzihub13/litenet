// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChangePassword)
const changePasswordProvider = ChangePasswordProvider._();

final class ChangePasswordProvider
    extends $AsyncNotifierProvider<ChangePassword, ChangePasswordResponse?> {
  const ChangePasswordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changePasswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changePasswordHash();

  @$internal
  @override
  ChangePassword create() => ChangePassword();
}

String _$changePasswordHash() => r'0676858bf134cb3ba42e9ab50393926731e741fd';

abstract class _$ChangePassword
    extends $AsyncNotifier<ChangePasswordResponse?> {
  FutureOr<ChangePasswordResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ChangePasswordResponse?>,
              ChangePasswordResponse?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ChangePasswordResponse?>,
                ChangePasswordResponse?
              >,
              AsyncValue<ChangePasswordResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
