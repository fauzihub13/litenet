// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapLocationResponseModel {

 List<MapLocationDataModel>? get data;
/// Create a copy of MapLocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapLocationResponseModelCopyWith<MapLocationResponseModel> get copyWith => _$MapLocationResponseModelCopyWithImpl<MapLocationResponseModel>(this as MapLocationResponseModel, _$identity);

  /// Serializes this MapLocationResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapLocationResponseModel&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MapLocationResponseModel(data: $data)';
}


}

/// @nodoc
abstract mixin class $MapLocationResponseModelCopyWith<$Res>  {
  factory $MapLocationResponseModelCopyWith(MapLocationResponseModel value, $Res Function(MapLocationResponseModel) _then) = _$MapLocationResponseModelCopyWithImpl;
@useResult
$Res call({
 List<MapLocationDataModel>? data
});




}
/// @nodoc
class _$MapLocationResponseModelCopyWithImpl<$Res>
    implements $MapLocationResponseModelCopyWith<$Res> {
  _$MapLocationResponseModelCopyWithImpl(this._self, this._then);

  final MapLocationResponseModel _self;
  final $Res Function(MapLocationResponseModel) _then;

/// Create a copy of MapLocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MapLocationDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapLocationResponseModel].
extension MapLocationResponseModelPatterns on MapLocationResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapLocationResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapLocationResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapLocationResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _MapLocationResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapLocationResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _MapLocationResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MapLocationDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapLocationResponseModel() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MapLocationDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _MapLocationResponseModel():
return $default(_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MapLocationDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _MapLocationResponseModel() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapLocationResponseModel implements MapLocationResponseModel {
  const _MapLocationResponseModel({final  List<MapLocationDataModel>? data}): _data = data;
  factory _MapLocationResponseModel.fromJson(Map<String, dynamic> json) => _$MapLocationResponseModelFromJson(json);

 final  List<MapLocationDataModel>? _data;
@override List<MapLocationDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MapLocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapLocationResponseModelCopyWith<_MapLocationResponseModel> get copyWith => __$MapLocationResponseModelCopyWithImpl<_MapLocationResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapLocationResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapLocationResponseModel&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MapLocationResponseModel(data: $data)';
}


}

/// @nodoc
abstract mixin class _$MapLocationResponseModelCopyWith<$Res> implements $MapLocationResponseModelCopyWith<$Res> {
  factory _$MapLocationResponseModelCopyWith(_MapLocationResponseModel value, $Res Function(_MapLocationResponseModel) _then) = __$MapLocationResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<MapLocationDataModel>? data
});




}
/// @nodoc
class __$MapLocationResponseModelCopyWithImpl<$Res>
    implements _$MapLocationResponseModelCopyWith<$Res> {
  __$MapLocationResponseModelCopyWithImpl(this._self, this._then);

  final _MapLocationResponseModel _self;
  final $Res Function(_MapLocationResponseModel) _then;

/// Create a copy of MapLocationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_MapLocationResponseModel(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MapLocationDataModel>?,
  ));
}


}


/// @nodoc
mixin _$MapLocationDataModel {

 int? get placeId; String? get licence; String? get osmType; int? get osmId; String? get lat; String? get lon; String? get mapLocationClass; String? get type; int? get placeRank; double? get importance; String? get addresstype; String? get name; String? get displayName; List<String>? get boundingbox;
/// Create a copy of MapLocationDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapLocationDataModelCopyWith<MapLocationDataModel> get copyWith => _$MapLocationDataModelCopyWithImpl<MapLocationDataModel>(this as MapLocationDataModel, _$identity);

  /// Serializes this MapLocationDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapLocationDataModel&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.licence, licence) || other.licence == licence)&&(identical(other.osmType, osmType) || other.osmType == osmType)&&(identical(other.osmId, osmId) || other.osmId == osmId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.mapLocationClass, mapLocationClass) || other.mapLocationClass == mapLocationClass)&&(identical(other.type, type) || other.type == type)&&(identical(other.placeRank, placeRank) || other.placeRank == placeRank)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.addresstype, addresstype) || other.addresstype == addresstype)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other.boundingbox, boundingbox));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,licence,osmType,osmId,lat,lon,mapLocationClass,type,placeRank,importance,addresstype,name,displayName,const DeepCollectionEquality().hash(boundingbox));

@override
String toString() {
  return 'MapLocationDataModel(placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, lat: $lat, lon: $lon, mapLocationClass: $mapLocationClass, type: $type, placeRank: $placeRank, importance: $importance, addresstype: $addresstype, name: $name, displayName: $displayName, boundingbox: $boundingbox)';
}


}

/// @nodoc
abstract mixin class $MapLocationDataModelCopyWith<$Res>  {
  factory $MapLocationDataModelCopyWith(MapLocationDataModel value, $Res Function(MapLocationDataModel) _then) = _$MapLocationDataModelCopyWithImpl;
@useResult
$Res call({
 int? placeId, String? licence, String? osmType, int? osmId, String? lat, String? lon, String? mapLocationClass, String? type, int? placeRank, double? importance, String? addresstype, String? name, String? displayName, List<String>? boundingbox
});




}
/// @nodoc
class _$MapLocationDataModelCopyWithImpl<$Res>
    implements $MapLocationDataModelCopyWith<$Res> {
  _$MapLocationDataModelCopyWithImpl(this._self, this._then);

  final MapLocationDataModel _self;
  final $Res Function(MapLocationDataModel) _then;

/// Create a copy of MapLocationDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = freezed,Object? licence = freezed,Object? osmType = freezed,Object? osmId = freezed,Object? lat = freezed,Object? lon = freezed,Object? mapLocationClass = freezed,Object? type = freezed,Object? placeRank = freezed,Object? importance = freezed,Object? addresstype = freezed,Object? name = freezed,Object? displayName = freezed,Object? boundingbox = freezed,}) {
  return _then(_self.copyWith(
placeId: freezed == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as int?,licence: freezed == licence ? _self.licence : licence // ignore: cast_nullable_to_non_nullable
as String?,osmType: freezed == osmType ? _self.osmType : osmType // ignore: cast_nullable_to_non_nullable
as String?,osmId: freezed == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as int?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,mapLocationClass: freezed == mapLocationClass ? _self.mapLocationClass : mapLocationClass // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,placeRank: freezed == placeRank ? _self.placeRank : placeRank // ignore: cast_nullable_to_non_nullable
as int?,importance: freezed == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as double?,addresstype: freezed == addresstype ? _self.addresstype : addresstype // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,boundingbox: freezed == boundingbox ? _self.boundingbox : boundingbox // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapLocationDataModel].
extension MapLocationDataModelPatterns on MapLocationDataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapLocationDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapLocationDataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapLocationDataModel value)  $default,){
final _that = this;
switch (_that) {
case _MapLocationDataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapLocationDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MapLocationDataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? placeId,  String? licence,  String? osmType,  int? osmId,  String? lat,  String? lon,  String? mapLocationClass,  String? type,  int? placeRank,  double? importance,  String? addresstype,  String? name,  String? displayName,  List<String>? boundingbox)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapLocationDataModel() when $default != null:
return $default(_that.placeId,_that.licence,_that.osmType,_that.osmId,_that.lat,_that.lon,_that.mapLocationClass,_that.type,_that.placeRank,_that.importance,_that.addresstype,_that.name,_that.displayName,_that.boundingbox);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? placeId,  String? licence,  String? osmType,  int? osmId,  String? lat,  String? lon,  String? mapLocationClass,  String? type,  int? placeRank,  double? importance,  String? addresstype,  String? name,  String? displayName,  List<String>? boundingbox)  $default,) {final _that = this;
switch (_that) {
case _MapLocationDataModel():
return $default(_that.placeId,_that.licence,_that.osmType,_that.osmId,_that.lat,_that.lon,_that.mapLocationClass,_that.type,_that.placeRank,_that.importance,_that.addresstype,_that.name,_that.displayName,_that.boundingbox);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? placeId,  String? licence,  String? osmType,  int? osmId,  String? lat,  String? lon,  String? mapLocationClass,  String? type,  int? placeRank,  double? importance,  String? addresstype,  String? name,  String? displayName,  List<String>? boundingbox)?  $default,) {final _that = this;
switch (_that) {
case _MapLocationDataModel() when $default != null:
return $default(_that.placeId,_that.licence,_that.osmType,_that.osmId,_that.lat,_that.lon,_that.mapLocationClass,_that.type,_that.placeRank,_that.importance,_that.addresstype,_that.name,_that.displayName,_that.boundingbox);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapLocationDataModel implements MapLocationDataModel {
  const _MapLocationDataModel({this.placeId, this.licence, this.osmType, this.osmId, this.lat, this.lon, this.mapLocationClass, this.type, this.placeRank, this.importance, this.addresstype, this.name, this.displayName, final  List<String>? boundingbox}): _boundingbox = boundingbox;
  factory _MapLocationDataModel.fromJson(Map<String, dynamic> json) => _$MapLocationDataModelFromJson(json);

@override final  int? placeId;
@override final  String? licence;
@override final  String? osmType;
@override final  int? osmId;
@override final  String? lat;
@override final  String? lon;
@override final  String? mapLocationClass;
@override final  String? type;
@override final  int? placeRank;
@override final  double? importance;
@override final  String? addresstype;
@override final  String? name;
@override final  String? displayName;
 final  List<String>? _boundingbox;
@override List<String>? get boundingbox {
  final value = _boundingbox;
  if (value == null) return null;
  if (_boundingbox is EqualUnmodifiableListView) return _boundingbox;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MapLocationDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapLocationDataModelCopyWith<_MapLocationDataModel> get copyWith => __$MapLocationDataModelCopyWithImpl<_MapLocationDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapLocationDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapLocationDataModel&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.licence, licence) || other.licence == licence)&&(identical(other.osmType, osmType) || other.osmType == osmType)&&(identical(other.osmId, osmId) || other.osmId == osmId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.mapLocationClass, mapLocationClass) || other.mapLocationClass == mapLocationClass)&&(identical(other.type, type) || other.type == type)&&(identical(other.placeRank, placeRank) || other.placeRank == placeRank)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.addresstype, addresstype) || other.addresstype == addresstype)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other._boundingbox, _boundingbox));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,licence,osmType,osmId,lat,lon,mapLocationClass,type,placeRank,importance,addresstype,name,displayName,const DeepCollectionEquality().hash(_boundingbox));

@override
String toString() {
  return 'MapLocationDataModel(placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, lat: $lat, lon: $lon, mapLocationClass: $mapLocationClass, type: $type, placeRank: $placeRank, importance: $importance, addresstype: $addresstype, name: $name, displayName: $displayName, boundingbox: $boundingbox)';
}


}

/// @nodoc
abstract mixin class _$MapLocationDataModelCopyWith<$Res> implements $MapLocationDataModelCopyWith<$Res> {
  factory _$MapLocationDataModelCopyWith(_MapLocationDataModel value, $Res Function(_MapLocationDataModel) _then) = __$MapLocationDataModelCopyWithImpl;
@override @useResult
$Res call({
 int? placeId, String? licence, String? osmType, int? osmId, String? lat, String? lon, String? mapLocationClass, String? type, int? placeRank, double? importance, String? addresstype, String? name, String? displayName, List<String>? boundingbox
});




}
/// @nodoc
class __$MapLocationDataModelCopyWithImpl<$Res>
    implements _$MapLocationDataModelCopyWith<$Res> {
  __$MapLocationDataModelCopyWithImpl(this._self, this._then);

  final _MapLocationDataModel _self;
  final $Res Function(_MapLocationDataModel) _then;

/// Create a copy of MapLocationDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = freezed,Object? licence = freezed,Object? osmType = freezed,Object? osmId = freezed,Object? lat = freezed,Object? lon = freezed,Object? mapLocationClass = freezed,Object? type = freezed,Object? placeRank = freezed,Object? importance = freezed,Object? addresstype = freezed,Object? name = freezed,Object? displayName = freezed,Object? boundingbox = freezed,}) {
  return _then(_MapLocationDataModel(
placeId: freezed == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as int?,licence: freezed == licence ? _self.licence : licence // ignore: cast_nullable_to_non_nullable
as String?,osmType: freezed == osmType ? _self.osmType : osmType // ignore: cast_nullable_to_non_nullable
as String?,osmId: freezed == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as int?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,mapLocationClass: freezed == mapLocationClass ? _self.mapLocationClass : mapLocationClass // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,placeRank: freezed == placeRank ? _self.placeRank : placeRank // ignore: cast_nullable_to_non_nullable
as int?,importance: freezed == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as double?,addresstype: freezed == addresstype ? _self.addresstype : addresstype // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,boundingbox: freezed == boundingbox ? _self._boundingbox : boundingbox // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
