import 'package:litenet/features/device/data/models/map_location_model.dart';
import 'package:litenet/features/device/domain/entities/map_location.dart';

extension MapLocationResponseModelMapper on MapLocationResponseModel {
  MapLocationResponse toEntity() {
    return MapLocationResponse(
    
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension MapLocationDataModelMapper on MapLocationDataModel {
  MapLocationEntity toEntity() {
    return MapLocationEntity(
      placeId: placeId ?? 0,
      licence: licence ?? '-',
      osmType: osmType ?? '-',
      osmId: osmId ?? 0,
      lat: lat ?? '-',
      lon: lon ?? '-',
      mapLocationClass: mapLocationClass ?? '-',
      type: type ?? '-',
      placeRank: placeRank ?? 0,
      importance: importance ?? 0.0,
      addresstype: addresstype ?? '-',
      name: name ?? '-',
      displayName: displayName ?? '-',
      boundingbox: boundingbox ?? [],
    );
  }
}
