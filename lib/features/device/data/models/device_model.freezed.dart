// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceResponseModel {

 bool? get success; String? get message; List<DeviceDataModel>? get data;
/// Create a copy of DeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceResponseModelCopyWith<DeviceResponseModel> get copyWith => _$DeviceResponseModelCopyWithImpl<DeviceResponseModel>(this as DeviceResponseModel, _$identity);

  /// Serializes this DeviceResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DeviceResponseModelCopyWith<$Res>  {
  factory $DeviceResponseModelCopyWith(DeviceResponseModel value, $Res Function(DeviceResponseModel) _then) = _$DeviceResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<DeviceDataModel>? data
});




}
/// @nodoc
class _$DeviceResponseModelCopyWithImpl<$Res>
    implements $DeviceResponseModelCopyWith<$Res> {
  _$DeviceResponseModelCopyWithImpl(this._self, this._then);

  final DeviceResponseModel _self;
  final $Res Function(DeviceResponseModel) _then;

/// Create a copy of DeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DeviceDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceResponseModel].
extension DeviceResponseModelPatterns on DeviceResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<DeviceDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<DeviceDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _DeviceResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<DeviceDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _DeviceResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceResponseModel implements DeviceResponseModel {
  const _DeviceResponseModel({this.success, this.message, final  List<DeviceDataModel>? data}): _data = data;
  factory _DeviceResponseModel.fromJson(Map<String, dynamic> json) => _$DeviceResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<DeviceDataModel>? _data;
@override List<DeviceDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceResponseModelCopyWith<_DeviceResponseModel> get copyWith => __$DeviceResponseModelCopyWithImpl<_DeviceResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DeviceResponseModelCopyWith<$Res> implements $DeviceResponseModelCopyWith<$Res> {
  factory _$DeviceResponseModelCopyWith(_DeviceResponseModel value, $Res Function(_DeviceResponseModel) _then) = __$DeviceResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<DeviceDataModel>? data
});




}
/// @nodoc
class __$DeviceResponseModelCopyWithImpl<$Res>
    implements _$DeviceResponseModelCopyWith<$Res> {
  __$DeviceResponseModelCopyWithImpl(this._self, this._then);

  final _DeviceResponseModel _self;
  final $Res Function(_DeviceResponseModel) _then;

/// Create a copy of DeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_DeviceResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DeviceDataModel>?,
  ));
}


}


/// @nodoc
mixin _$DeviceDataModel {

 String? get deviceId; String? get userId; String? get userName; String? get name; String? get kitSerialNumber; String? get nodelink; String? get address; double? get latitude; double? get longitude; String? get status; int? get quotaTotal; int? get quotaUsed; int? get quotaLeft; DateTime? get activeSince; dynamic get activeUntil; dynamic get dataPlan;
/// Create a copy of DeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceDataModelCopyWith<DeviceDataModel> get copyWith => _$DeviceDataModelCopyWithImpl<DeviceDataModel>(this as DeviceDataModel, _$identity);

  /// Serializes this DeviceDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceDataModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.name, name) || other.name == name)&&(identical(other.kitSerialNumber, kitSerialNumber) || other.kitSerialNumber == kitSerialNumber)&&(identical(other.nodelink, nodelink) || other.nodelink == nodelink)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.quotaTotal, quotaTotal) || other.quotaTotal == quotaTotal)&&(identical(other.quotaUsed, quotaUsed) || other.quotaUsed == quotaUsed)&&(identical(other.quotaLeft, quotaLeft) || other.quotaLeft == quotaLeft)&&(identical(other.activeSince, activeSince) || other.activeSince == activeSince)&&const DeepCollectionEquality().equals(other.activeUntil, activeUntil)&&const DeepCollectionEquality().equals(other.dataPlan, dataPlan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,userId,userName,name,kitSerialNumber,nodelink,address,latitude,longitude,status,quotaTotal,quotaUsed,quotaLeft,activeSince,const DeepCollectionEquality().hash(activeUntil),const DeepCollectionEquality().hash(dataPlan));

@override
String toString() {
  return 'DeviceDataModel(deviceId: $deviceId, userId: $userId, userName: $userName, name: $name, kitSerialNumber: $kitSerialNumber, nodelink: $nodelink, address: $address, latitude: $latitude, longitude: $longitude, status: $status, quotaTotal: $quotaTotal, quotaUsed: $quotaUsed, quotaLeft: $quotaLeft, activeSince: $activeSince, activeUntil: $activeUntil, dataPlan: $dataPlan)';
}


}

/// @nodoc
abstract mixin class $DeviceDataModelCopyWith<$Res>  {
  factory $DeviceDataModelCopyWith(DeviceDataModel value, $Res Function(DeviceDataModel) _then) = _$DeviceDataModelCopyWithImpl;
@useResult
$Res call({
 String? deviceId, String? userId, String? userName, String? name, String? kitSerialNumber, String? nodelink, String? address, double? latitude, double? longitude, String? status, int? quotaTotal, int? quotaUsed, int? quotaLeft, DateTime? activeSince, dynamic activeUntil, dynamic dataPlan
});




}
/// @nodoc
class _$DeviceDataModelCopyWithImpl<$Res>
    implements $DeviceDataModelCopyWith<$Res> {
  _$DeviceDataModelCopyWithImpl(this._self, this._then);

  final DeviceDataModel _self;
  final $Res Function(DeviceDataModel) _then;

/// Create a copy of DeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = freezed,Object? userId = freezed,Object? userName = freezed,Object? name = freezed,Object? kitSerialNumber = freezed,Object? nodelink = freezed,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = freezed,Object? quotaTotal = freezed,Object? quotaUsed = freezed,Object? quotaLeft = freezed,Object? activeSince = freezed,Object? activeUntil = freezed,Object? dataPlan = freezed,}) {
  return _then(_self.copyWith(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,kitSerialNumber: freezed == kitSerialNumber ? _self.kitSerialNumber : kitSerialNumber // ignore: cast_nullable_to_non_nullable
as String?,nodelink: freezed == nodelink ? _self.nodelink : nodelink // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,quotaTotal: freezed == quotaTotal ? _self.quotaTotal : quotaTotal // ignore: cast_nullable_to_non_nullable
as int?,quotaUsed: freezed == quotaUsed ? _self.quotaUsed : quotaUsed // ignore: cast_nullable_to_non_nullable
as int?,quotaLeft: freezed == quotaLeft ? _self.quotaLeft : quotaLeft // ignore: cast_nullable_to_non_nullable
as int?,activeSince: freezed == activeSince ? _self.activeSince : activeSince // ignore: cast_nullable_to_non_nullable
as DateTime?,activeUntil: freezed == activeUntil ? _self.activeUntil : activeUntil // ignore: cast_nullable_to_non_nullable
as dynamic,dataPlan: freezed == dataPlan ? _self.dataPlan : dataPlan // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceDataModel].
extension DeviceDataModelPatterns on DeviceDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceDataModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? deviceId,  String? userId,  String? userName,  String? name,  String? kitSerialNumber,  String? nodelink,  String? address,  double? latitude,  double? longitude,  String? status,  int? quotaTotal,  int? quotaUsed,  int? quotaLeft,  DateTime? activeSince,  dynamic activeUntil,  dynamic dataPlan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceDataModel() when $default != null:
return $default(_that.deviceId,_that.userId,_that.userName,_that.name,_that.kitSerialNumber,_that.nodelink,_that.address,_that.latitude,_that.longitude,_that.status,_that.quotaTotal,_that.quotaUsed,_that.quotaLeft,_that.activeSince,_that.activeUntil,_that.dataPlan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? deviceId,  String? userId,  String? userName,  String? name,  String? kitSerialNumber,  String? nodelink,  String? address,  double? latitude,  double? longitude,  String? status,  int? quotaTotal,  int? quotaUsed,  int? quotaLeft,  DateTime? activeSince,  dynamic activeUntil,  dynamic dataPlan)  $default,) {final _that = this;
switch (_that) {
case _DeviceDataModel():
return $default(_that.deviceId,_that.userId,_that.userName,_that.name,_that.kitSerialNumber,_that.nodelink,_that.address,_that.latitude,_that.longitude,_that.status,_that.quotaTotal,_that.quotaUsed,_that.quotaLeft,_that.activeSince,_that.activeUntil,_that.dataPlan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? deviceId,  String? userId,  String? userName,  String? name,  String? kitSerialNumber,  String? nodelink,  String? address,  double? latitude,  double? longitude,  String? status,  int? quotaTotal,  int? quotaUsed,  int? quotaLeft,  DateTime? activeSince,  dynamic activeUntil,  dynamic dataPlan)?  $default,) {final _that = this;
switch (_that) {
case _DeviceDataModel() when $default != null:
return $default(_that.deviceId,_that.userId,_that.userName,_that.name,_that.kitSerialNumber,_that.nodelink,_that.address,_that.latitude,_that.longitude,_that.status,_that.quotaTotal,_that.quotaUsed,_that.quotaLeft,_that.activeSince,_that.activeUntil,_that.dataPlan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceDataModel implements DeviceDataModel {
  const _DeviceDataModel({this.deviceId, this.userId, this.userName, this.name, this.kitSerialNumber, this.nodelink, this.address, this.latitude, this.longitude, this.status, this.quotaTotal, this.quotaUsed, this.quotaLeft, this.activeSince, this.activeUntil, this.dataPlan});
  factory _DeviceDataModel.fromJson(Map<String, dynamic> json) => _$DeviceDataModelFromJson(json);

@override final  String? deviceId;
@override final  String? userId;
@override final  String? userName;
@override final  String? name;
@override final  String? kitSerialNumber;
@override final  String? nodelink;
@override final  String? address;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? status;
@override final  int? quotaTotal;
@override final  int? quotaUsed;
@override final  int? quotaLeft;
@override final  DateTime? activeSince;
@override final  dynamic activeUntil;
@override final  dynamic dataPlan;

/// Create a copy of DeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceDataModelCopyWith<_DeviceDataModel> get copyWith => __$DeviceDataModelCopyWithImpl<_DeviceDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceDataModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.name, name) || other.name == name)&&(identical(other.kitSerialNumber, kitSerialNumber) || other.kitSerialNumber == kitSerialNumber)&&(identical(other.nodelink, nodelink) || other.nodelink == nodelink)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.quotaTotal, quotaTotal) || other.quotaTotal == quotaTotal)&&(identical(other.quotaUsed, quotaUsed) || other.quotaUsed == quotaUsed)&&(identical(other.quotaLeft, quotaLeft) || other.quotaLeft == quotaLeft)&&(identical(other.activeSince, activeSince) || other.activeSince == activeSince)&&const DeepCollectionEquality().equals(other.activeUntil, activeUntil)&&const DeepCollectionEquality().equals(other.dataPlan, dataPlan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,userId,userName,name,kitSerialNumber,nodelink,address,latitude,longitude,status,quotaTotal,quotaUsed,quotaLeft,activeSince,const DeepCollectionEquality().hash(activeUntil),const DeepCollectionEquality().hash(dataPlan));

@override
String toString() {
  return 'DeviceDataModel(deviceId: $deviceId, userId: $userId, userName: $userName, name: $name, kitSerialNumber: $kitSerialNumber, nodelink: $nodelink, address: $address, latitude: $latitude, longitude: $longitude, status: $status, quotaTotal: $quotaTotal, quotaUsed: $quotaUsed, quotaLeft: $quotaLeft, activeSince: $activeSince, activeUntil: $activeUntil, dataPlan: $dataPlan)';
}


}

/// @nodoc
abstract mixin class _$DeviceDataModelCopyWith<$Res> implements $DeviceDataModelCopyWith<$Res> {
  factory _$DeviceDataModelCopyWith(_DeviceDataModel value, $Res Function(_DeviceDataModel) _then) = __$DeviceDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? deviceId, String? userId, String? userName, String? name, String? kitSerialNumber, String? nodelink, String? address, double? latitude, double? longitude, String? status, int? quotaTotal, int? quotaUsed, int? quotaLeft, DateTime? activeSince, dynamic activeUntil, dynamic dataPlan
});




}
/// @nodoc
class __$DeviceDataModelCopyWithImpl<$Res>
    implements _$DeviceDataModelCopyWith<$Res> {
  __$DeviceDataModelCopyWithImpl(this._self, this._then);

  final _DeviceDataModel _self;
  final $Res Function(_DeviceDataModel) _then;

/// Create a copy of DeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,Object? userId = freezed,Object? userName = freezed,Object? name = freezed,Object? kitSerialNumber = freezed,Object? nodelink = freezed,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = freezed,Object? quotaTotal = freezed,Object? quotaUsed = freezed,Object? quotaLeft = freezed,Object? activeSince = freezed,Object? activeUntil = freezed,Object? dataPlan = freezed,}) {
  return _then(_DeviceDataModel(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,kitSerialNumber: freezed == kitSerialNumber ? _self.kitSerialNumber : kitSerialNumber // ignore: cast_nullable_to_non_nullable
as String?,nodelink: freezed == nodelink ? _self.nodelink : nodelink // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,quotaTotal: freezed == quotaTotal ? _self.quotaTotal : quotaTotal // ignore: cast_nullable_to_non_nullable
as int?,quotaUsed: freezed == quotaUsed ? _self.quotaUsed : quotaUsed // ignore: cast_nullable_to_non_nullable
as int?,quotaLeft: freezed == quotaLeft ? _self.quotaLeft : quotaLeft // ignore: cast_nullable_to_non_nullable
as int?,activeSince: freezed == activeSince ? _self.activeSince : activeSince // ignore: cast_nullable_to_non_nullable
as DateTime?,activeUntil: freezed == activeUntil ? _self.activeUntil : activeUntil // ignore: cast_nullable_to_non_nullable
as dynamic,dataPlan: freezed == dataPlan ? _self.dataPlan : dataPlan // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
