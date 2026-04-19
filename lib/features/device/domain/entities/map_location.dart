class MapLocationResponse {
  final List<MapLocationEntity> data;

  const MapLocationResponse({
    required this.data,
  });
}

class MapLocationEntity {
  final int placeId;
  final String licence;
  final String osmType;
  final int osmId;
  final String lat;
  final String lon;
  final String mapLocationClass;
  final String type;
  final int placeRank;
  final double importance;
  final String addresstype;
  final String name;
  final String displayName;
  final List<String> boundingbox;

  const MapLocationEntity({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.mapLocationClass,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addresstype,
    required this.name,
    required this.displayName,
    required this.boundingbox,
  });
}
