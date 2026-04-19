import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/map_location.dart';
import 'package:litenet/features/device/domain/usecases/get_location_suggestion_usecase.dart';
import 'package:litenet/features/device/presentation/controllers/get_location_suggestion_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLocationSuggestionUsecase extends Mock
    implements GetLocationSuggestionUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetLocationSuggestionUsecase mockGetLocationSuggestionUsecase;

  late ProviderContainer container;

  final tMapLocationEntity = MapLocationEntity(
    placeId: 403111413,
    licence: "Data © OpenStreetMap contributors",
    osmType: "relation",
    osmId: 6362934,
    lat: "-6.1754049",
    lon: "106.8271680",
    mapLocationClass: "boundary",
    type: "administrative",
    placeRank: 8,
    importance: 0.7480095115175435,
    addresstype: "city",
    name: "Daerah Khusus Ibukota Jakarta",
    displayName: "Daerah Khusus Ibukota Jakarta, Jawa, Indonesia",
    boundingbox: ["-6.3744575", "-4.9993635", "106.3146732", "106.9739750"],
  );

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<MapLocationResponse?>());
  });

  setUp(() {
    mockGetLocationSuggestionUsecase = MockGetLocationSuggestionUsecase();

    container = ProviderContainer(
      overrides: [
        getLocationSuggestionUsecaseProvider.overrideWithValue(
          mockGetLocationSuggestionUsecase,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  final tFailure = Failure(message: 'Failed to fetch devices');

  group('GetLocationSuggestionProvider', () {
    final tResponse = MapLocationResponse(data: [tMapLocationEntity]);

    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(getLocationSuggestionProvider.future);
      expect(state, null);
    });

    test('should emit loading and then data on success', () async {
      when(
        () => mockGetLocationSuggestionUsecase.call(query: any(named: 'query')),
      ).thenAnswer((_) async => Right(tResponse));

      await container.read(getLocationSuggestionProvider.future);

      final listener = Listener<AsyncValue<MapLocationResponse?>>();
      container.listen(
        getLocationSuggestionProvider,
        listener.call,
        fireImmediately: true,
      );

      await container
          .read(getLocationSuggestionProvider.notifier)
          .fetchLocationSuggestion(query: 'Jakarta');

      verifyInOrder([
        () => listener(any(), const AsyncData<MapLocationResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<MapLocationResponse?>(tResponse)),
      ]);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(
        () => mockGetLocationSuggestionUsecase.call(query: any(named: 'query')),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(getLocationSuggestionProvider.future);

      final listener = Listener<AsyncValue<MapLocationResponse?>>();
      container.listen(
        getLocationSuggestionProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(getLocationSuggestionProvider.notifier);

      // act
      await notifier.fetchLocationSuggestion(query: 'Jakarta');

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<MapLocationResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(getLocationSuggestionProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
