import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/map_location.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';
import 'package:litenet/features/device/domain/usecases/get_location_suggestion_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceRepository extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepository mockRepository;
  late GetLocationSuggestionUsecase getLocationSuggestionUsecase;

  setUp(() {
    mockRepository = MockDeviceRepository();

    getLocationSuggestionUsecase = GetLocationSuggestionUsecase(mockRepository);
  });

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

  final tMapLocationResponse = MapLocationResponse(data: [tMapLocationEntity]);

  group('GetLocationSuggestionUsecase', () {
    test('should call getLocationSuggestion from repository', () async {
      // arrange
      when(
        () => mockRepository.getLocationSuggestion(query: 'Jakarta'),
      ).thenAnswer((_) async => Right(tMapLocationResponse));

      // act
      final result = await getLocationSuggestionUsecase(query: "Jakarta");

      // assert
      expect(result, Right(tMapLocationResponse));
      verify(
        () => mockRepository.getLocationSuggestion(query: 'Jakarta'),
      ).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Network error');
      when(
        () => mockRepository.getLocationSuggestion(query: 'Jakarta'),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await getLocationSuggestionUsecase(query: 'Jakarta');

      // assert
      expect(result, Left(tFailure));
    });
  });
}
