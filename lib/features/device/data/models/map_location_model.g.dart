// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapLocationResponseModel _$MapLocationResponseModelFromJson(
  Map<String, dynamic> json,
) => _MapLocationResponseModel(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => MapLocationDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MapLocationResponseModelToJson(
  _MapLocationResponseModel instance,
) => <String, dynamic>{'data': instance.data};

_MapLocationDataModel _$MapLocationDataModelFromJson(
  Map<String, dynamic> json,
) => _MapLocationDataModel(
  placeId: (json['place_id'] as num?)?.toInt(),
  licence: json['licence'] as String?,
  osmType: json['osm_type'] as String?,
  osmId: (json['osm_id'] as num?)?.toInt(),
  lat: json['lat'] as String?,
  lon: json['lon'] as String?,
  mapLocationClass: json['map_location_class'] as String?,
  type: json['type'] as String?,
  placeRank: (json['place_rank'] as num?)?.toInt(),
  importance: (json['importance'] as num?)?.toDouble(),
  addresstype: json['addresstype'] as String?,
  name: json['name'] as String?,
  displayName: json['display_name'] as String?,
  boundingbox: (json['boundingbox'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$MapLocationDataModelToJson(
  _MapLocationDataModel instance,
) => <String, dynamic>{
  'place_id': instance.placeId,
  'licence': instance.licence,
  'osm_type': instance.osmType,
  'osm_id': instance.osmId,
  'lat': instance.lat,
  'lon': instance.lon,
  'map_location_class': instance.mapLocationClass,
  'type': instance.type,
  'place_rank': instance.placeRank,
  'importance': instance.importance,
  'addresstype': instance.addresstype,
  'name': instance.name,
  'display_name': instance.displayName,
  'boundingbox': instance.boundingbox,
};
