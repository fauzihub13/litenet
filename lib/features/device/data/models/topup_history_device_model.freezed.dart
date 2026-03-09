// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topup_history_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopupHistoryDeviceResponseModel {

 bool? get success; String? get message; List<TopupHistoryDeviceDataModel>? get data;
/// Create a copy of TopupHistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopupHistoryDeviceResponseModelCopyWith<TopupHistoryDeviceResponseModel> get copyWith => _$TopupHistoryDeviceResponseModelCopyWithImpl<TopupHistoryDeviceResponseModel>(this as TopupHistoryDeviceResponseModel, _$identity);

  /// Serializes this TopupHistoryDeviceResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopupHistoryDeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TopupHistoryDeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $TopupHistoryDeviceResponseModelCopyWith<$Res>  {
  factory $TopupHistoryDeviceResponseModelCopyWith(TopupHistoryDeviceResponseModel value, $Res Function(TopupHistoryDeviceResponseModel) _then) = _$TopupHistoryDeviceResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<TopupHistoryDeviceDataModel>? data
});




}
/// @nodoc
class _$TopupHistoryDeviceResponseModelCopyWithImpl<$Res>
    implements $TopupHistoryDeviceResponseModelCopyWith<$Res> {
  _$TopupHistoryDeviceResponseModelCopyWithImpl(this._self, this._then);

  final TopupHistoryDeviceResponseModel _self;
  final $Res Function(TopupHistoryDeviceResponseModel) _then;

/// Create a copy of TopupHistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TopupHistoryDeviceDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopupHistoryDeviceResponseModel].
extension TopupHistoryDeviceResponseModelPatterns on TopupHistoryDeviceResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopupHistoryDeviceResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopupHistoryDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopupHistoryDeviceResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TopupHistoryDeviceResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopupHistoryDeviceResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopupHistoryDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<TopupHistoryDeviceDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopupHistoryDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<TopupHistoryDeviceDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _TopupHistoryDeviceResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<TopupHistoryDeviceDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _TopupHistoryDeviceResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopupHistoryDeviceResponseModel implements TopupHistoryDeviceResponseModel {
  const _TopupHistoryDeviceResponseModel({this.success, this.message, final  List<TopupHistoryDeviceDataModel>? data}): _data = data;
  factory _TopupHistoryDeviceResponseModel.fromJson(Map<String, dynamic> json) => _$TopupHistoryDeviceResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<TopupHistoryDeviceDataModel>? _data;
@override List<TopupHistoryDeviceDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TopupHistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopupHistoryDeviceResponseModelCopyWith<_TopupHistoryDeviceResponseModel> get copyWith => __$TopupHistoryDeviceResponseModelCopyWithImpl<_TopupHistoryDeviceResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopupHistoryDeviceResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopupHistoryDeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'TopupHistoryDeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TopupHistoryDeviceResponseModelCopyWith<$Res> implements $TopupHistoryDeviceResponseModelCopyWith<$Res> {
  factory _$TopupHistoryDeviceResponseModelCopyWith(_TopupHistoryDeviceResponseModel value, $Res Function(_TopupHistoryDeviceResponseModel) _then) = __$TopupHistoryDeviceResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<TopupHistoryDeviceDataModel>? data
});




}
/// @nodoc
class __$TopupHistoryDeviceResponseModelCopyWithImpl<$Res>
    implements _$TopupHistoryDeviceResponseModelCopyWith<$Res> {
  __$TopupHistoryDeviceResponseModelCopyWithImpl(this._self, this._then);

  final _TopupHistoryDeviceResponseModel _self;
  final $Res Function(_TopupHistoryDeviceResponseModel) _then;

/// Create a copy of TopupHistoryDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_TopupHistoryDeviceResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TopupHistoryDeviceDataModel>?,
  ));
}


}


/// @nodoc
mixin _$TopupHistoryDeviceDataModel {

 String? get id; String? get deviceId; String? get dataPlanId; DateTime? get startAt; DateTime? get endAt; int? get price; String? get packageName; String? get capacity; int? get quotaTotal; int? get quotaUsed; DateTime? get createdAt; DateTime? get updatedAt; dynamic get deletedAt;
/// Create a copy of TopupHistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopupHistoryDeviceDataModelCopyWith<TopupHistoryDeviceDataModel> get copyWith => _$TopupHistoryDeviceDataModelCopyWithImpl<TopupHistoryDeviceDataModel>(this as TopupHistoryDeviceDataModel, _$identity);

  /// Serializes this TopupHistoryDeviceDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopupHistoryDeviceDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.dataPlanId, dataPlanId) || other.dataPlanId == dataPlanId)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.price, price) || other.price == price)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.quotaTotal, quotaTotal) || other.quotaTotal == quotaTotal)&&(identical(other.quotaUsed, quotaUsed) || other.quotaUsed == quotaUsed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,dataPlanId,startAt,endAt,price,packageName,capacity,quotaTotal,quotaUsed,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'TopupHistoryDeviceDataModel(id: $id, deviceId: $deviceId, dataPlanId: $dataPlanId, startAt: $startAt, endAt: $endAt, price: $price, packageName: $packageName, capacity: $capacity, quotaTotal: $quotaTotal, quotaUsed: $quotaUsed, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $TopupHistoryDeviceDataModelCopyWith<$Res>  {
  factory $TopupHistoryDeviceDataModelCopyWith(TopupHistoryDeviceDataModel value, $Res Function(TopupHistoryDeviceDataModel) _then) = _$TopupHistoryDeviceDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? deviceId, String? dataPlanId, DateTime? startAt, DateTime? endAt, int? price, String? packageName, String? capacity, int? quotaTotal, int? quotaUsed, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class _$TopupHistoryDeviceDataModelCopyWithImpl<$Res>
    implements $TopupHistoryDeviceDataModelCopyWith<$Res> {
  _$TopupHistoryDeviceDataModelCopyWithImpl(this._self, this._then);

  final TopupHistoryDeviceDataModel _self;
  final $Res Function(TopupHistoryDeviceDataModel) _then;

/// Create a copy of TopupHistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? deviceId = freezed,Object? dataPlanId = freezed,Object? startAt = freezed,Object? endAt = freezed,Object? price = freezed,Object? packageName = freezed,Object? capacity = freezed,Object? quotaTotal = freezed,Object? quotaUsed = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,dataPlanId: freezed == dataPlanId ? _self.dataPlanId : dataPlanId // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,quotaTotal: freezed == quotaTotal ? _self.quotaTotal : quotaTotal // ignore: cast_nullable_to_non_nullable
as int?,quotaUsed: freezed == quotaUsed ? _self.quotaUsed : quotaUsed // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [TopupHistoryDeviceDataModel].
extension TopupHistoryDeviceDataModelPatterns on TopupHistoryDeviceDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopupHistoryDeviceDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopupHistoryDeviceDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopupHistoryDeviceDataModel value)  $default,){
final _that = this;
switch (_that) {
case _TopupHistoryDeviceDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopupHistoryDeviceDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopupHistoryDeviceDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? deviceId,  String? dataPlanId,  DateTime? startAt,  DateTime? endAt,  int? price,  String? packageName,  String? capacity,  int? quotaTotal,  int? quotaUsed,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopupHistoryDeviceDataModel() when $default != null:
return $default(_that.id,_that.deviceId,_that.dataPlanId,_that.startAt,_that.endAt,_that.price,_that.packageName,_that.capacity,_that.quotaTotal,_that.quotaUsed,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? deviceId,  String? dataPlanId,  DateTime? startAt,  DateTime? endAt,  int? price,  String? packageName,  String? capacity,  int? quotaTotal,  int? quotaUsed,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)  $default,) {final _that = this;
switch (_that) {
case _TopupHistoryDeviceDataModel():
return $default(_that.id,_that.deviceId,_that.dataPlanId,_that.startAt,_that.endAt,_that.price,_that.packageName,_that.capacity,_that.quotaTotal,_that.quotaUsed,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? deviceId,  String? dataPlanId,  DateTime? startAt,  DateTime? endAt,  int? price,  String? packageName,  String? capacity,  int? quotaTotal,  int? quotaUsed,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _TopupHistoryDeviceDataModel() when $default != null:
return $default(_that.id,_that.deviceId,_that.dataPlanId,_that.startAt,_that.endAt,_that.price,_that.packageName,_that.capacity,_that.quotaTotal,_that.quotaUsed,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopupHistoryDeviceDataModel implements TopupHistoryDeviceDataModel {
  const _TopupHistoryDeviceDataModel({this.id, this.deviceId, this.dataPlanId, this.startAt, this.endAt, this.price, this.packageName, this.capacity, this.quotaTotal, this.quotaUsed, this.createdAt, this.updatedAt, this.deletedAt});
  factory _TopupHistoryDeviceDataModel.fromJson(Map<String, dynamic> json) => _$TopupHistoryDeviceDataModelFromJson(json);

@override final  String? id;
@override final  String? deviceId;
@override final  String? dataPlanId;
@override final  DateTime? startAt;
@override final  DateTime? endAt;
@override final  int? price;
@override final  String? packageName;
@override final  String? capacity;
@override final  int? quotaTotal;
@override final  int? quotaUsed;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  dynamic deletedAt;

/// Create a copy of TopupHistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopupHistoryDeviceDataModelCopyWith<_TopupHistoryDeviceDataModel> get copyWith => __$TopupHistoryDeviceDataModelCopyWithImpl<_TopupHistoryDeviceDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopupHistoryDeviceDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopupHistoryDeviceDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.dataPlanId, dataPlanId) || other.dataPlanId == dataPlanId)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.price, price) || other.price == price)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.quotaTotal, quotaTotal) || other.quotaTotal == quotaTotal)&&(identical(other.quotaUsed, quotaUsed) || other.quotaUsed == quotaUsed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,dataPlanId,startAt,endAt,price,packageName,capacity,quotaTotal,quotaUsed,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'TopupHistoryDeviceDataModel(id: $id, deviceId: $deviceId, dataPlanId: $dataPlanId, startAt: $startAt, endAt: $endAt, price: $price, packageName: $packageName, capacity: $capacity, quotaTotal: $quotaTotal, quotaUsed: $quotaUsed, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$TopupHistoryDeviceDataModelCopyWith<$Res> implements $TopupHistoryDeviceDataModelCopyWith<$Res> {
  factory _$TopupHistoryDeviceDataModelCopyWith(_TopupHistoryDeviceDataModel value, $Res Function(_TopupHistoryDeviceDataModel) _then) = __$TopupHistoryDeviceDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? deviceId, String? dataPlanId, DateTime? startAt, DateTime? endAt, int? price, String? packageName, String? capacity, int? quotaTotal, int? quotaUsed, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class __$TopupHistoryDeviceDataModelCopyWithImpl<$Res>
    implements _$TopupHistoryDeviceDataModelCopyWith<$Res> {
  __$TopupHistoryDeviceDataModelCopyWithImpl(this._self, this._then);

  final _TopupHistoryDeviceDataModel _self;
  final $Res Function(_TopupHistoryDeviceDataModel) _then;

/// Create a copy of TopupHistoryDeviceDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? deviceId = freezed,Object? dataPlanId = freezed,Object? startAt = freezed,Object? endAt = freezed,Object? price = freezed,Object? packageName = freezed,Object? capacity = freezed,Object? quotaTotal = freezed,Object? quotaUsed = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_TopupHistoryDeviceDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,dataPlanId: freezed == dataPlanId ? _self.dataPlanId : dataPlanId // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,quotaTotal: freezed == quotaTotal ? _self.quotaTotal : quotaTotal // ignore: cast_nullable_to_non_nullable
as int?,quotaUsed: freezed == quotaUsed ? _self.quotaUsed : quotaUsed // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
