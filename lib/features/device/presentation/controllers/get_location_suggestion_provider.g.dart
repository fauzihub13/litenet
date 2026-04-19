// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location_suggestion_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetLocationSuggestion)
const getLocationSuggestionProvider = GetLocationSuggestionProvider._();

final class GetLocationSuggestionProvider
    extends
        $AsyncNotifierProvider<GetLocationSuggestion, MapLocationResponse?> {
  const GetLocationSuggestionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getLocationSuggestionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getLocationSuggestionHash();

  @$internal
  @override
  GetLocationSuggestion create() => GetLocationSuggestion();
}

String _$getLocationSuggestionHash() =>
    r'0ef0743c1adc11be71742660b97c3f87ba19024e';

abstract class _$GetLocationSuggestion
    extends $AsyncNotifier<MapLocationResponse?> {
  FutureOr<MapLocationResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<MapLocationResponse?>, MapLocationResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MapLocationResponse?>,
                MapLocationResponse?
              >,
              AsyncValue<MapLocationResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
