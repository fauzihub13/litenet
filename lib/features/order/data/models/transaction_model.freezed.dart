// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionResponseModel {

 bool? get success; String? get message; List<TransactionDataModel>? get data;
/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionResponseModelCopyWith<TransactionResponseModel> get copyWith => _$TransactionResponseModelCopyWithImpl<TransactionResponseModel>(this as TransactionResponseModel, _$identity);

  /// Serializes this TransactionResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TransactionResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $TransactionResponseModelCopyWith<$Res>  {
  factory $TransactionResponseModelCopyWith(TransactionResponseModel value, $Res Function(TransactionResponseModel) _then) = _$TransactionResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<TransactionDataModel>? data
});




}
/// @nodoc
class _$TransactionResponseModelCopyWithImpl<$Res>
    implements $TransactionResponseModelCopyWith<$Res> {
  _$TransactionResponseModelCopyWithImpl(this._self, this._then);

  final TransactionResponseModel _self;
  final $Res Function(TransactionResponseModel) _then;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionResponseModel].
extension TransactionResponseModelPatterns on TransactionResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<TransactionDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<TransactionDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _TransactionResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<TransactionDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionResponseModel implements TransactionResponseModel {
  const _TransactionResponseModel({this.success, this.message, final  List<TransactionDataModel>? data}): _data = data;
  factory _TransactionResponseModel.fromJson(Map<String, dynamic> json) => _$TransactionResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<TransactionDataModel>? _data;
@override List<TransactionDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionResponseModelCopyWith<_TransactionResponseModel> get copyWith => __$TransactionResponseModelCopyWithImpl<_TransactionResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'TransactionResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TransactionResponseModelCopyWith<$Res> implements $TransactionResponseModelCopyWith<$Res> {
  factory _$TransactionResponseModelCopyWith(_TransactionResponseModel value, $Res Function(_TransactionResponseModel) _then) = __$TransactionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<TransactionDataModel>? data
});




}
/// @nodoc
class __$TransactionResponseModelCopyWithImpl<$Res>
    implements _$TransactionResponseModelCopyWith<$Res> {
  __$TransactionResponseModelCopyWithImpl(this._self, this._then);

  final _TransactionResponseModel _self;
  final $Res Function(_TransactionResponseModel) _then;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_TransactionResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionDataModel>?,
  ));
}


}


/// @nodoc
mixin _$TransactionDataModel {

 String? get id; String? get orderId; String? get packageName; String? get capacity; String? get transactionStatus; int? get grossAmount; DateTime? get createdAt;
/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDataModelCopyWith<TransactionDataModel> get copyWith => _$TransactionDataModelCopyWithImpl<TransactionDataModel>(this as TransactionDataModel, _$identity);

  /// Serializes this TransactionDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.transactionStatus, transactionStatus) || other.transactionStatus == transactionStatus)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,packageName,capacity,transactionStatus,grossAmount,createdAt);

@override
String toString() {
  return 'TransactionDataModel(id: $id, orderId: $orderId, packageName: $packageName, capacity: $capacity, transactionStatus: $transactionStatus, grossAmount: $grossAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransactionDataModelCopyWith<$Res>  {
  factory $TransactionDataModelCopyWith(TransactionDataModel value, $Res Function(TransactionDataModel) _then) = _$TransactionDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? packageName, String? capacity, String? transactionStatus, int? grossAmount, DateTime? createdAt
});




}
/// @nodoc
class _$TransactionDataModelCopyWithImpl<$Res>
    implements $TransactionDataModelCopyWith<$Res> {
  _$TransactionDataModelCopyWithImpl(this._self, this._then);

  final TransactionDataModel _self;
  final $Res Function(TransactionDataModel) _then;

/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? packageName = freezed,Object? capacity = freezed,Object? transactionStatus = freezed,Object? grossAmount = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,transactionStatus: freezed == transactionStatus ? _self.transactionStatus : transactionStatus // ignore: cast_nullable_to_non_nullable
as String?,grossAmount: freezed == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionDataModel].
extension TransactionDataModelPatterns on TransactionDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDataModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? orderId,  String? packageName,  String? capacity,  String? transactionStatus,  int? grossAmount,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDataModel() when $default != null:
return $default(_that.id,_that.orderId,_that.packageName,_that.capacity,_that.transactionStatus,_that.grossAmount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? orderId,  String? packageName,  String? capacity,  String? transactionStatus,  int? grossAmount,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TransactionDataModel():
return $default(_that.id,_that.orderId,_that.packageName,_that.capacity,_that.transactionStatus,_that.grossAmount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? orderId,  String? packageName,  String? capacity,  String? transactionStatus,  int? grossAmount,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDataModel() when $default != null:
return $default(_that.id,_that.orderId,_that.packageName,_that.capacity,_that.transactionStatus,_that.grossAmount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionDataModel implements TransactionDataModel {
  const _TransactionDataModel({this.id, this.orderId, this.packageName, this.capacity, this.transactionStatus, this.grossAmount, this.createdAt});
  factory _TransactionDataModel.fromJson(Map<String, dynamic> json) => _$TransactionDataModelFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? packageName;
@override final  String? capacity;
@override final  String? transactionStatus;
@override final  int? grossAmount;
@override final  DateTime? createdAt;

/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDataModelCopyWith<_TransactionDataModel> get copyWith => __$TransactionDataModelCopyWithImpl<_TransactionDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.transactionStatus, transactionStatus) || other.transactionStatus == transactionStatus)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,packageName,capacity,transactionStatus,grossAmount,createdAt);

@override
String toString() {
  return 'TransactionDataModel(id: $id, orderId: $orderId, packageName: $packageName, capacity: $capacity, transactionStatus: $transactionStatus, grossAmount: $grossAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionDataModelCopyWith<$Res> implements $TransactionDataModelCopyWith<$Res> {
  factory _$TransactionDataModelCopyWith(_TransactionDataModel value, $Res Function(_TransactionDataModel) _then) = __$TransactionDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? packageName, String? capacity, String? transactionStatus, int? grossAmount, DateTime? createdAt
});




}
/// @nodoc
class __$TransactionDataModelCopyWithImpl<$Res>
    implements _$TransactionDataModelCopyWith<$Res> {
  __$TransactionDataModelCopyWithImpl(this._self, this._then);

  final _TransactionDataModel _self;
  final $Res Function(_TransactionDataModel) _then;

/// Create a copy of TransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? packageName = freezed,Object? capacity = freezed,Object? transactionStatus = freezed,Object? grossAmount = freezed,Object? createdAt = freezed,}) {
  return _then(_TransactionDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,transactionStatus: freezed == transactionStatus ? _self.transactionStatus : transactionStatus // ignore: cast_nullable_to_non_nullable
as String?,grossAmount: freezed == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
