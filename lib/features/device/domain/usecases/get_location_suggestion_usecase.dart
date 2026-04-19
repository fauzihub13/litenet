import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/map_location.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';

class GetLocationSuggestionUsecase {
  final DeviceRepository deviceRepository;

  const GetLocationSuggestionUsecase(this.deviceRepository);

  Future<Either<Failure, MapLocationResponse>> call({
    required String query,
  }) async {
    return await deviceRepository.getLocationSuggestion(query: query);
  }
}
