// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_payment_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckPaymentStatusResponseModel {

 bool? get success; String? get message; CheckPaymentStatusDataModel? get data;
/// Create a copy of CheckPaymentStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPaymentStatusResponseModelCopyWith<CheckPaymentStatusResponseModel> get copyWith => _$CheckPaymentStatusResponseModelCopyWithImpl<CheckPaymentStatusResponseModel>(this as CheckPaymentStatusResponseModel, _$identity);

  /// Serializes this CheckPaymentStatusResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPaymentStatusResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CheckPaymentStatusResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CheckPaymentStatusResponseModelCopyWith<$Res>  {
  factory $CheckPaymentStatusResponseModelCopyWith(CheckPaymentStatusResponseModel value, $Res Function(CheckPaymentStatusResponseModel) _then) = _$CheckPaymentStatusResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, CheckPaymentStatusDataModel? data
});


$CheckPaymentStatusDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$CheckPaymentStatusResponseModelCopyWithImpl<$Res>
    implements $CheckPaymentStatusResponseModelCopyWith<$Res> {
  _$CheckPaymentStatusResponseModelCopyWithImpl(this._self, this._then);

  final CheckPaymentStatusResponseModel _self;
  final $Res Function(CheckPaymentStatusResponseModel) _then;

/// Create a copy of CheckPaymentStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CheckPaymentStatusDataModel?,
  ));
}
/// Create a copy of CheckPaymentStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckPaymentStatusDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CheckPaymentStatusDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckPaymentStatusResponseModel].
extension CheckPaymentStatusResponseModelPatterns on CheckPaymentStatusResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckPaymentStatusResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckPaymentStatusResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckPaymentStatusResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CheckPaymentStatusResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckPaymentStatusResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CheckPaymentStatusResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  CheckPaymentStatusDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckPaymentStatusResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  CheckPaymentStatusDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _CheckPaymentStatusResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  CheckPaymentStatusDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _CheckPaymentStatusResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckPaymentStatusResponseModel implements CheckPaymentStatusResponseModel {
  const _CheckPaymentStatusResponseModel({this.success, this.message, this.data});
  factory _CheckPaymentStatusResponseModel.fromJson(Map<String, dynamic> json) => _$CheckPaymentStatusResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  CheckPaymentStatusDataModel? data;

/// Create a copy of CheckPaymentStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckPaymentStatusResponseModelCopyWith<_CheckPaymentStatusResponseModel> get copyWith => __$CheckPaymentStatusResponseModelCopyWithImpl<_CheckPaymentStatusResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckPaymentStatusResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckPaymentStatusResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CheckPaymentStatusResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CheckPaymentStatusResponseModelCopyWith<$Res> implements $CheckPaymentStatusResponseModelCopyWith<$Res> {
  factory _$CheckPaymentStatusResponseModelCopyWith(_CheckPaymentStatusResponseModel value, $Res Function(_CheckPaymentStatusResponseModel) _then) = __$CheckPaymentStatusResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, CheckPaymentStatusDataModel? data
});


@override $CheckPaymentStatusDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$CheckPaymentStatusResponseModelCopyWithImpl<$Res>
    implements _$CheckPaymentStatusResponseModelCopyWith<$Res> {
  __$CheckPaymentStatusResponseModelCopyWithImpl(this._self, this._then);

  final _CheckPaymentStatusResponseModel _self;
  final $Res Function(_CheckPaymentStatusResponseModel) _then;

/// Create a copy of CheckPaymentStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CheckPaymentStatusResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CheckPaymentStatusDataModel?,
  ));
}

/// Create a copy of CheckPaymentStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckPaymentStatusDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CheckPaymentStatusDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CheckPaymentStatusDataModel {

 String? get id; String? get userId; String? get orderId; String? get transactionStatus; String? get fraudStatus; String? get bank; DateTime? get expiredAt;
/// Create a copy of CheckPaymentStatusDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPaymentStatusDataModelCopyWith<CheckPaymentStatusDataModel> get copyWith => _$CheckPaymentStatusDataModelCopyWithImpl<CheckPaymentStatusDataModel>(this as CheckPaymentStatusDataModel, _$identity);

  /// Serializes this CheckPaymentStatusDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPaymentStatusDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.transactionStatus, transactionStatus) || other.transactionStatus == transactionStatus)&&(identical(other.fraudStatus, fraudStatus) || other.fraudStatus == fraudStatus)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,orderId,transactionStatus,fraudStatus,bank,expiredAt);

@override
String toString() {
  return 'CheckPaymentStatusDataModel(id: $id, userId: $userId, orderId: $orderId, transactionStatus: $transactionStatus, fraudStatus: $fraudStatus, bank: $bank, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class $CheckPaymentStatusDataModelCopyWith<$Res>  {
  factory $CheckPaymentStatusDataModelCopyWith(CheckPaymentStatusDataModel value, $Res Function(CheckPaymentStatusDataModel) _then) = _$CheckPaymentStatusDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? userId, String? orderId, String? transactionStatus, String? fraudStatus, String? bank, DateTime? expiredAt
});




}
/// @nodoc
class _$CheckPaymentStatusDataModelCopyWithImpl<$Res>
    implements $CheckPaymentStatusDataModelCopyWith<$Res> {
  _$CheckPaymentStatusDataModelCopyWithImpl(this._self, this._then);

  final CheckPaymentStatusDataModel _self;
  final $Res Function(CheckPaymentStatusDataModel) _then;

/// Create a copy of CheckPaymentStatusDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? orderId = freezed,Object? transactionStatus = freezed,Object? fraudStatus = freezed,Object? bank = freezed,Object? expiredAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,transactionStatus: freezed == transactionStatus ? _self.transactionStatus : transactionStatus // ignore: cast_nullable_to_non_nullable
as String?,fraudStatus: freezed == fraudStatus ? _self.fraudStatus : fraudStatus // ignore: cast_nullable_to_non_nullable
as String?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckPaymentStatusDataModel].
extension CheckPaymentStatusDataModelPatterns on CheckPaymentStatusDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckPaymentStatusDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckPaymentStatusDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckPaymentStatusDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CheckPaymentStatusDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckPaymentStatusDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CheckPaymentStatusDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? userId,  String? orderId,  String? transactionStatus,  String? fraudStatus,  String? bank,  DateTime? expiredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckPaymentStatusDataModel() when $default != null:
return $default(_that.id,_that.userId,_that.orderId,_that.transactionStatus,_that.fraudStatus,_that.bank,_that.expiredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? userId,  String? orderId,  String? transactionStatus,  String? fraudStatus,  String? bank,  DateTime? expiredAt)  $default,) {final _that = this;
switch (_that) {
case _CheckPaymentStatusDataModel():
return $default(_that.id,_that.userId,_that.orderId,_that.transactionStatus,_that.fraudStatus,_that.bank,_that.expiredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? userId,  String? orderId,  String? transactionStatus,  String? fraudStatus,  String? bank,  DateTime? expiredAt)?  $default,) {final _that = this;
switch (_that) {
case _CheckPaymentStatusDataModel() when $default != null:
return $default(_that.id,_that.userId,_that.orderId,_that.transactionStatus,_that.fraudStatus,_that.bank,_that.expiredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckPaymentStatusDataModel implements CheckPaymentStatusDataModel {
  const _CheckPaymentStatusDataModel({this.id, this.userId, this.orderId, this.transactionStatus, this.fraudStatus, this.bank, this.expiredAt});
  factory _CheckPaymentStatusDataModel.fromJson(Map<String, dynamic> json) => _$CheckPaymentStatusDataModelFromJson(json);

@override final  String? id;
@override final  String? userId;
@override final  String? orderId;
@override final  String? transactionStatus;
@override final  String? fraudStatus;
@override final  String? bank;
@override final  DateTime? expiredAt;

/// Create a copy of CheckPaymentStatusDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckPaymentStatusDataModelCopyWith<_CheckPaymentStatusDataModel> get copyWith => __$CheckPaymentStatusDataModelCopyWithImpl<_CheckPaymentStatusDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckPaymentStatusDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckPaymentStatusDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.transactionStatus, transactionStatus) || other.transactionStatus == transactionStatus)&&(identical(other.fraudStatus, fraudStatus) || other.fraudStatus == fraudStatus)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,orderId,transactionStatus,fraudStatus,bank,expiredAt);

@override
String toString() {
  return 'CheckPaymentStatusDataModel(id: $id, userId: $userId, orderId: $orderId, transactionStatus: $transactionStatus, fraudStatus: $fraudStatus, bank: $bank, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class _$CheckPaymentStatusDataModelCopyWith<$Res> implements $CheckPaymentStatusDataModelCopyWith<$Res> {
  factory _$CheckPaymentStatusDataModelCopyWith(_CheckPaymentStatusDataModel value, $Res Function(_CheckPaymentStatusDataModel) _then) = __$CheckPaymentStatusDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? userId, String? orderId, String? transactionStatus, String? fraudStatus, String? bank, DateTime? expiredAt
});




}
/// @nodoc
class __$CheckPaymentStatusDataModelCopyWithImpl<$Res>
    implements _$CheckPaymentStatusDataModelCopyWith<$Res> {
  __$CheckPaymentStatusDataModelCopyWithImpl(this._self, this._then);

  final _CheckPaymentStatusDataModel _self;
  final $Res Function(_CheckPaymentStatusDataModel) _then;

/// Create a copy of CheckPaymentStatusDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? orderId = freezed,Object? transactionStatus = freezed,Object? fraudStatus = freezed,Object? bank = freezed,Object? expiredAt = freezed,}) {
  return _then(_CheckPaymentStatusDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,transactionStatus: freezed == transactionStatus ? _self.transactionStatus : transactionStatus // ignore: cast_nullable_to_non_nullable
as String?,fraudStatus: freezed == fraudStatus ? _self.fraudStatus : fraudStatus // ignore: cast_nullable_to_non_nullable
as String?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
