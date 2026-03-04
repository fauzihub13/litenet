// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChangeProfile)
const changeProfileProvider = ChangeProfileProvider._();

final class ChangeProfileProvider
    extends $AsyncNotifierProvider<ChangeProfile, ProfileResponse?> {
  const ChangeProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changeProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changeProfileHash();

  @$internal
  @override
  ChangeProfile create() => ChangeProfile();
}

String _$changeProfileHash() => r'9589f41fc3ff9f8e658950177e60e65eefeed84b';

abstract class _$ChangeProfile extends $AsyncNotifier<ProfileResponse?> {
  FutureOr<ProfileResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ProfileResponse?>, ProfileResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileResponse?>, ProfileResponse?>,
              AsyncValue<ProfileResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
