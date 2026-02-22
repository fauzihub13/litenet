// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenManager)
const tokenManagerProvider = TokenManagerProvider._();

final class TokenManagerProvider
    extends
        $FunctionalProvider<
          AsyncValue<TokenManager>,
          TokenManager,
          FutureOr<TokenManager>
        >
    with $FutureModifier<TokenManager>, $FutureProvider<TokenManager> {
  const TokenManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenManagerHash();

  @$internal
  @override
  $FutureProviderElement<TokenManager> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TokenManager> create(Ref ref) {
    return tokenManager(ref);
  }
}

String _$tokenManagerHash() => r'04abd3c036e2953e9d1380b31697c9dbb84d7b62';
