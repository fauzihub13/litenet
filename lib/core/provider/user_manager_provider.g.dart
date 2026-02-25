// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userManager)
const userManagerProvider = UserManagerProvider._();

final class UserManagerProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserManager>,
          UserManager,
          FutureOr<UserManager>
        >
    with $FutureModifier<UserManager>, $FutureProvider<UserManager> {
  const UserManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userManagerHash();

  @$internal
  @override
  $FutureProviderElement<UserManager> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserManager> create(Ref ref) {
    return userManager(ref);
  }
}

String _$userManagerHash() => r'299f78471569e1d71604de745c09df7dc3e2a087';

@ProviderFor(getCurrentUser)
const getCurrentUserProvider = GetCurrentUserProvider._();

final class GetCurrentUserProvider
    extends $FunctionalProvider<AsyncValue<User>, User, FutureOr<User>>
    with $FutureModifier<User>, $FutureProvider<User> {
  const GetCurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserHash();

  @$internal
  @override
  $FutureProviderElement<User> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User> create(Ref ref) {
    return getCurrentUser(ref);
  }
}

String _$getCurrentUserHash() => r'49cea28c3797e3bc7ceed3e7c3b78dda586ff09d';
