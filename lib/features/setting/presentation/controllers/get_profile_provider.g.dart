// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetProfile)
const getProfileProvider = GetProfileProvider._();

final class GetProfileProvider
    extends $AsyncNotifierProvider<GetProfile, ProfileResponse> {
  const GetProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProfileHash();

  @$internal
  @override
  GetProfile create() => GetProfile();
}

String _$getProfileHash() => r'fd1f00a511468c2fb467fafabf2c33ad6f81abe2';

abstract class _$GetProfile extends $AsyncNotifier<ProfileResponse> {
  FutureOr<ProfileResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ProfileResponse>, ProfileResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileResponse>, ProfileResponse>,
              AsyncValue<ProfileResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
