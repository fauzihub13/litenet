// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryDeviceResponseModel {

 bool? get success; String? get message; List<HistoryDeviceDataModel>? get data;
/// Create a copy of HistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDeviceResponseModelCopyWith<HistoryDeviceResponseModel> get copyWith => _$HistoryDeviceResponseModelCopyWithImpl<HistoryDeviceResponseModel>(this as HistoryDeviceResponseModel, _$identity);

  /// Serializes this HistoryDeviceResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'HistoryDeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $HistoryDeviceResponseModelCopyWith<$Res>  {
  factory $HistoryDeviceResponseModelCopyWith(HistoryDeviceResponseModel value, $Res Function(HistoryDeviceResponseModel) _then) = _$HistoryDeviceResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<HistoryDeviceDataModel>? data
});




}
/// @nodoc
class _$HistoryDeviceResponseModelCopyWithImpl<$Res>
    implements $HistoryDeviceResponseModelCopyWith<$Res> {
  _$HistoryDeviceResponseModelCopyWithImpl(this._self, this._then);

  final HistoryDeviceResponseModel _self;
  final $Res Function(HistoryDeviceResponseModel) _then;

/// Create a copy of HistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<HistoryDeviceDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryDeviceResponseModel].
extension HistoryDeviceResponseModelPatterns on HistoryDeviceResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryDeviceResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryDeviceResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _HistoryDeviceResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryDeviceResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<HistoryDeviceDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryDeviceResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<HistoryDeviceDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _HistoryDeviceResponseModel():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<HistoryDeviceDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _HistoryDeviceResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryDeviceResponseModel implements HistoryDeviceResponseModel {
  const _HistoryDeviceResponseModel({this.success, this.message, final  List<HistoryDeviceDataModel>? data}): _data = data;
  factory _HistoryDeviceResponseModel.fromJson(Map<String, dynamic> json) => _$HistoryDeviceResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<HistoryDeviceDataModel>? _data;
@override List<HistoryDeviceDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryDeviceResponseModelCopyWith<_HistoryDeviceResponseModel> get copyWith => __$HistoryDeviceResponseModelCopyWithImpl<_HistoryDeviceResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryDeviceResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryDeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'HistoryDeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$HistoryDeviceResponseModelCopyWith<$Res> implements $HistoryDeviceResponseModelCopyWith<$Res> {
  factory _$HistoryDeviceResponseModelCopyWith(_HistoryDeviceResponseModel value, $Res Function(_HistoryDeviceResponseModel) _then) = __$HistoryDeviceResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<HistoryDeviceDataModel>? data
});




}
/// @nodoc
class __$HistoryDeviceResponseModelCopyWithImpl<$Res>
    implements _$HistoryDeviceResponseModelCopyWith<$Res> {
  __$HistoryDeviceResponseModelCopyWithImpl(this._self, this._then);

  final _HistoryDeviceResponseModel _self;
  final $Res Function(_HistoryDeviceResponseModel) _then;

/// Create a copy of HistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_HistoryDeviceResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<HistoryDeviceDataModel>?,
  ));
}


}


/// @nodoc
mixin _$HistoryDeviceDataModel {

 String? get id; String? get deviceId; String? get kitSerialNumber; String? get nodelink; String? get name; double? get latitude; double? get longitude; String? get detailAddress; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of HistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDeviceDataModelCopyWith<HistoryDeviceDataModel> get copyWith => _$HistoryDeviceDataModelCopyWithImpl<HistoryDeviceDataModel>(this as HistoryDeviceDataModel, _$identity);

  /// Serializes this HistoryDeviceDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDeviceDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.kitSerialNumber, kitSerialNumber) || other.kitSerialNumber == kitSerialNumber)&&(identical(other.nodelink, nodelink) || other.nodelink == nodelink)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detailAddress, detailAddress) || other.detailAddress == detailAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,kitSerialNumber,nodelink,name,latitude,longitude,detailAddress,createdAt,updatedAt);

@override
String toString() {
  return 'HistoryDeviceDataModel(id: $id, deviceId: $deviceId, kitSerialNumber: $kitSerialNumber, nodelink: $nodelink, name: $name, latitude: $latitude, longitude: $longitude, detailAddress: $detailAddress, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HistoryDeviceDataModelCopyWith<$Res>  {
  factory $HistoryDeviceDataModelCopyWith(HistoryDeviceDataModel value, $Res Function(HistoryDeviceDataModel) _then) = _$HistoryDeviceDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? deviceId, String? kitSerialNumber, String? nodelink, String? name, double? latitude, double? longitude, String? detailAddress, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$HistoryDeviceDataModelCopyWithImpl<$Res>
    implements $HistoryDeviceDataModelCopyWith<$Res> {
  _$HistoryDeviceDataModelCopyWithImpl(this._self, this._then);

  final HistoryDeviceDataModel _self;
  final $Res Function(HistoryDeviceDataModel) _then;

/// Create a copy of HistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? deviceId = freezed,Object? kitSerialNumber = freezed,Object? nodelink = freezed,Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? detailAddress = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,kitSerialNumber: freezed == kitSerialNumber ? _self.kitSerialNumber : kitSerialNumber // ignore: cast_nullable_to_non_nullable
as String?,nodelink: freezed == nodelink ? _self.nodelink : nodelink // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,detailAddress: freezed == detailAddress ? _self.detailAddress : detailAddress // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryDeviceDataModel].
extension HistoryDeviceDataModelPatterns on HistoryDeviceDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryDeviceDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryDeviceDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryDeviceDataModel value)  $default,){
final _that = this;
switch (_that) {
case _HistoryDeviceDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryDeviceDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryDeviceDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? deviceId,  String? kitSerialNumber,  String? nodelink,  String? name,  double? latitude,  double? longitude,  String? detailAddress,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryDeviceDataModel() when $default != null:
return $default(_that.id,_that.deviceId,_that.kitSerialNumber,_that.nodelink,_that.name,_that.latitude,_that.longitude,_that.detailAddress,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? deviceId,  String? kitSerialNumber,  String? nodelink,  String? name,  double? latitude,  double? longitude,  String? detailAddress,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryDeviceDataModel():
return $default(_that.id,_that.deviceId,_that.kitSerialNumber,_that.nodelink,_that.name,_that.latitude,_that.longitude,_that.detailAddress,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? deviceId,  String? kitSerialNumber,  String? nodelink,  String? name,  double? latitude,  double? longitude,  String? detailAddress,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryDeviceDataModel() when $default != null:
return $default(_that.id,_that.deviceId,_that.kitSerialNumber,_that.nodelink,_that.name,_that.latitude,_that.longitude,_that.detailAddress,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryDeviceDataModel implements HistoryDeviceDataModel {
  const _HistoryDeviceDataModel({this.id, this.deviceId, this.kitSerialNumber, this.nodelink, this.name, this.latitude, this.longitude, this.detailAddress, this.createdAt, this.updatedAt});
  factory _HistoryDeviceDataModel.fromJson(Map<String, dynamic> json) => _$HistoryDeviceDataModelFromJson(json);

@override final  String? id;
@override final  String? deviceId;
@override final  String? kitSerialNumber;
@override final  String? nodelink;
@override final  String? name;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? detailAddress;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of HistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryDeviceDataModelCopyWith<_HistoryDeviceDataModel> get copyWith => __$HistoryDeviceDataModelCopyWithImpl<_HistoryDeviceDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryDeviceDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryDeviceDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.kitSerialNumber, kitSerialNumber) || other.kitSerialNumber == kitSerialNumber)&&(identical(other.nodelink, nodelink) || other.nodelink == nodelink)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.detailAddress, detailAddress) || other.detailAddress == detailAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,kitSerialNumber,nodelink,name,latitude,longitude,detailAddress,createdAt,updatedAt);

@override
String toString() {
  return 'HistoryDeviceDataModel(id: $id, deviceId: $deviceId, kitSerialNumber: $kitSerialNumber, nodelink: $nodelink, name: $name, latitude: $latitude, longitude: $longitude, detailAddress: $detailAddress, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryDeviceDataModelCopyWith<$Res> implements $HistoryDeviceDataModelCopyWith<$Res> {
  factory _$HistoryDeviceDataModelCopyWith(_HistoryDeviceDataModel value, $Res Function(_HistoryDeviceDataModel) _then) = __$HistoryDeviceDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? deviceId, String? kitSerialNumber, String? nodelink, String? name, double? latitude, double? longitude, String? detailAddress, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$HistoryDeviceDataModelCopyWithImpl<$Res>
    implements _$HistoryDeviceDataModelCopyWith<$Res> {
  __$HistoryDeviceDataModelCopyWithImpl(this._self, this._then);

  final _HistoryDeviceDataModel _self;
  final $Res Function(_HistoryDeviceDataModel) _then;

/// Create a copy of HistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? deviceId = freezed,Object? kitSerialNumber = freezed,Object? nodelink = freezed,Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? detailAddress = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_HistoryDeviceDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,kitSerialNumber: freezed == kitSerialNumber ? _self.kitSerialNumber : kitSerialNumber // ignore: cast_nullable_to_non_nullable
as String?,nodelink: freezed == nodelink ? _self.nodelink : nodelink // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,detailAddress: freezed == detailAddress ? _self.detailAddress : detailAddress // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
