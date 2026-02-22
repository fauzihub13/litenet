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

String _$loginDatasourceHash() => r'c307da19dc4cbc484a9610cd74fc32a597a059df';
