// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Register)
const registerProvider = RegisterProvider._();

final class RegisterProvider
    extends $AsyncNotifierProvider<Register, RegisterResponse?> {
  const RegisterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerHash();

  @$internal
  @override
  Register create() => Register();
}

String _$registerHash() => r'659be23221849167e0ff4ad57f387fcaf354ebbc';

abstract class _$Register extends $AsyncNotifier<RegisterResponse?> {
  FutureOr<RegisterResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<RegisterResponse?>, RegisterResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RegisterResponse?>, RegisterResponse?>,
              AsyncValue<RegisterResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
