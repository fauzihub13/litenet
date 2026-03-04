// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_privacy_and_policy_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetPrivacyAndPolicy)
const getPrivacyAndPolicyProvider = GetPrivacyAndPolicyProvider._();

final class GetPrivacyAndPolicyProvider
    extends
        $AsyncNotifierProvider<GetPrivacyAndPolicy, PrivacyAndPolicyResponse> {
  const GetPrivacyAndPolicyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPrivacyAndPolicyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPrivacyAndPolicyHash();

  @$internal
  @override
  GetPrivacyAndPolicy create() => GetPrivacyAndPolicy();
}

String _$getPrivacyAndPolicyHash() =>
    r'dfe3393f3ce124d14f87b994721c83fc9d628dee';

abstract class _$GetPrivacyAndPolicy
    extends $AsyncNotifier<PrivacyAndPolicyResponse> {
  FutureOr<PrivacyAndPolicyResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PrivacyAndPolicyResponse>,
              PrivacyAndPolicyResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PrivacyAndPolicyResponse>,
                PrivacyAndPolicyResponse
              >,
              AsyncValue<PrivacyAndPolicyResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
