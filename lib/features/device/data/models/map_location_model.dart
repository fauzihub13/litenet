import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_location_model.freezed.dart';
part 'map_location_model.g.dart';

@freezed
abstract class MapLocationResponseModel with _$MapLocationResponseModel {
  const factory MapLocationResponseModel({List<MapLocationDataModel>? data}) =
      _MapLocationResponseModel;

  // factory MapLocationResponseModel.fromJson(Map<String, dynamic> json) =>
  //     _$MapLocationResponseModelFromJson(json);
  factory MapLocationResponseModel.fromJson(List<dynamic> json) =>
      MapLocationResponseModel(
        data: json.map((e) => MapLocationDataModel.fromJson(e)).toList(),
      );
}

@freezed
abstract class MapLocationDataModel with _$MapLocationDataModel {
  const factory MapLocationDataModel({
    int? placeId,
    String? licence,
    String? osmType,
    int? osmId,
    String? lat,
    String? lon,
    String? mapLocationClass,
    String? type,
    int? placeRank,
    double? importance,
    String? addresstype,
    String? name,
    String? displayName,
    List<String>? boundingbox,
  }) = _MapLocationDataModel;

  factory MapLocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$MapLocationDataModelFromJson(json);
}
