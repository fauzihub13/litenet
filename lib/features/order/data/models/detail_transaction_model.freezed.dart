// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailTransactionResponseModel {

 bool? get success; String? get message; DetailTransactionDataModel? get data;
/// Create a copy of DetailTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailTransactionResponseModelCopyWith<DetailTransactionResponseModel> get copyWith => _$DetailTransactionResponseModelCopyWithImpl<DetailTransactionResponseModel>(this as DetailTransactionResponseModel, _$identity);

  /// Serializes this DetailTransactionResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailTransactionResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DetailTransactionResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DetailTransactionResponseModelCopyWith<$Res>  {
  factory $DetailTransactionResponseModelCopyWith(DetailTransactionResponseModel value, $Res Function(DetailTransactionResponseModel) _then) = _$DetailTransactionResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, DetailTransactionDataModel? data
});


$DetailTransactionDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$DetailTransactionResponseModelCopyWithImpl<$Res>
    implements $DetailTransactionResponseModelCopyWith<$Res> {
  _$DetailTransactionResponseModelCopyWithImpl(this._self, this._then);

  final DetailTransactionResponseModel _self;
  final $Res Function(DetailTransactionResponseModel) _then;

/// Create a copy of DetailTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DetailTransactionDataModel?,
  ));
}
/// Create a copy of DetailTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailTransactionDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DetailTransactionDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailTransactionResponseModel].
extension DetailTransactionResponseModelPatterns on DetailTransactionResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailTransactionResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailTransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailTransactionResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailTransactionResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailTransactionResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailTransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  DetailTransactionDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailTransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  DetailTransactionDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _DetailTransactionResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  DetailTransactionDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _DetailTransactionResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailTransactionResponseModel implements DetailTransactionResponseModel {
  const _DetailTransactionResponseModel({this.success, this.message, this.data});
  factory _DetailTransactionResponseModel.fromJson(Map<String, dynamic> json) => _$DetailTransactionResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  DetailTransactionDataModel? data;

/// Create a copy of DetailTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailTransactionResponseModelCopyWith<_DetailTransactionResponseModel> get copyWith => __$DetailTransactionResponseModelCopyWithImpl<_DetailTransactionResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailTransactionResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailTransactionResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DetailTransactionResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DetailTransactionResponseModelCopyWith<$Res> implements $DetailTransactionResponseModelCopyWith<$Res> {
  factory _$DetailTransactionResponseModelCopyWith(_DetailTransactionResponseModel value, $Res Function(_DetailTransactionResponseModel) _then) = __$DetailTransactionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, DetailTransactionDataModel? data
});


@override $DetailTransactionDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$DetailTransactionResponseModelCopyWithImpl<$Res>
    implements _$DetailTransactionResponseModelCopyWith<$Res> {
  __$DetailTransactionResponseModelCopyWithImpl(this._self, this._then);

  final _DetailTransactionResponseModel _self;
  final $Res Function(_DetailTransactionResponseModel) _then;

/// Create a copy of DetailTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_DetailTransactionResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DetailTransactionDataModel?,
  ));
}

/// Create a copy of DetailTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailTransactionDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DetailTransactionDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DetailTransactionDataModel {

 String? get id; String? get orderId; String? get packageName; String? get capacity; String? get transactionStatus; int? get grossAmount; String? get bankCode; String? get bankName; String? get bankImageUrl; String? get vaNumber; DateTime? get createdAt; DateTime? get expiredAt;
/// Create a copy of DetailTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailTransactionDataModelCopyWith<DetailTransactionDataModel> get copyWith => _$DetailTransactionDataModelCopyWithImpl<DetailTransactionDataModel>(this as DetailTransactionDataModel, _$identity);

  /// Serializes this DetailTransactionDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailTransactionDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.transactionStatus, transactionStatus) || other.transactionStatus == transactionStatus)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankImageUrl, bankImageUrl) || other.bankImageUrl == bankImageUrl)&&(identical(other.vaNumber, vaNumber) || other.vaNumber == vaNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,packageName,capacity,transactionStatus,grossAmount,bankCode,bankName,bankImageUrl,vaNumber,createdAt,expiredAt);

@override
String toString() {
  return 'DetailTransactionDataModel(id: $id, orderId: $orderId, packageName: $packageName, capacity: $capacity, transactionStatus: $transactionStatus, grossAmount: $grossAmount, bankCode: $bankCode, bankName: $bankName, bankImageUrl: $bankImageUrl, vaNumber: $vaNumber, createdAt: $createdAt, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class $DetailTransactionDataModelCopyWith<$Res>  {
  factory $DetailTransactionDataModelCopyWith(DetailTransactionDataModel value, $Res Function(DetailTransactionDataModel) _then) = _$DetailTransactionDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? orderId, String? packageName, String? capacity, String? transactionStatus, int? grossAmount, String? bankCode, String? bankName, String? bankImageUrl, String? vaNumber, DateTime? createdAt, DateTime? expiredAt
});




}
/// @nodoc
class _$DetailTransactionDataModelCopyWithImpl<$Res>
    implements $DetailTransactionDataModelCopyWith<$Res> {
  _$DetailTransactionDataModelCopyWithImpl(this._self, this._then);

  final DetailTransactionDataModel _self;
  final $Res Function(DetailTransactionDataModel) _then;

/// Create a copy of DetailTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? packageName = freezed,Object? capacity = freezed,Object? transactionStatus = freezed,Object? grossAmount = freezed,Object? bankCode = freezed,Object? bankName = freezed,Object? bankImageUrl = freezed,Object? vaNumber = freezed,Object? createdAt = freezed,Object? expiredAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,transactionStatus: freezed == transactionStatus ? _self.transactionStatus : transactionStatus // ignore: cast_nullable_to_non_nullable
as String?,grossAmount: freezed == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as int?,bankCode: freezed == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankImageUrl: freezed == bankImageUrl ? _self.bankImageUrl : bankImageUrl // ignore: cast_nullable_to_non_nullable
as String?,vaNumber: freezed == vaNumber ? _self.vaNumber : vaNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailTransactionDataModel].
extension DetailTransactionDataModelPatterns on DetailTransactionDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailTransactionDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailTransactionDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailTransactionDataModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailTransactionDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailTransactionDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailTransactionDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? orderId,  String? packageName,  String? capacity,  String? transactionStatus,  int? grossAmount,  String? bankCode,  String? bankName,  String? bankImageUrl,  String? vaNumber,  DateTime? createdAt,  DateTime? expiredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailTransactionDataModel() when $default != null:
return $default(_that.id,_that.orderId,_that.packageName,_that.capacity,_that.transactionStatus,_that.grossAmount,_that.bankCode,_that.bankName,_that.bankImageUrl,_that.vaNumber,_that.createdAt,_that.expiredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? orderId,  String? packageName,  String? capacity,  String? transactionStatus,  int? grossAmount,  String? bankCode,  String? bankName,  String? bankImageUrl,  String? vaNumber,  DateTime? createdAt,  DateTime? expiredAt)  $default,) {final _that = this;
switch (_that) {
case _DetailTransactionDataModel():
return $default(_that.id,_that.orderId,_that.packageName,_that.capacity,_that.transactionStatus,_that.grossAmount,_that.bankCode,_that.bankName,_that.bankImageUrl,_that.vaNumber,_that.createdAt,_that.expiredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? orderId,  String? packageName,  String? capacity,  String? transactionStatus,  int? grossAmount,  String? bankCode,  String? bankName,  String? bankImageUrl,  String? vaNumber,  DateTime? createdAt,  DateTime? expiredAt)?  $default,) {final _that = this;
switch (_that) {
case _DetailTransactionDataModel() when $default != null:
return $default(_that.id,_that.orderId,_that.packageName,_that.capacity,_that.transactionStatus,_that.grossAmount,_that.bankCode,_that.bankName,_that.bankImageUrl,_that.vaNumber,_that.createdAt,_that.expiredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailTransactionDataModel implements DetailTransactionDataModel {
  const _DetailTransactionDataModel({this.id, this.orderId, this.packageName, this.capacity, this.transactionStatus, this.grossAmount, this.bankCode, this.bankName, this.bankImageUrl, this.vaNumber, this.createdAt, this.expiredAt});
  factory _DetailTransactionDataModel.fromJson(Map<String, dynamic> json) => _$DetailTransactionDataModelFromJson(json);

@override final  String? id;
@override final  String? orderId;
@override final  String? packageName;
@override final  String? capacity;
@override final  String? transactionStatus;
@override final  int? grossAmount;
@override final  String? bankCode;
@override final  String? bankName;
@override final  String? bankImageUrl;
@override final  String? vaNumber;
@override final  DateTime? createdAt;
@override final  DateTime? expiredAt;

/// Create a copy of DetailTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailTransactionDataModelCopyWith<_DetailTransactionDataModel> get copyWith => __$DetailTransactionDataModelCopyWithImpl<_DetailTransactionDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailTransactionDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailTransactionDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.transactionStatus, transactionStatus) || other.transactionStatus == transactionStatus)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankImageUrl, bankImageUrl) || other.bankImageUrl == bankImageUrl)&&(identical(other.vaNumber, vaNumber) || other.vaNumber == vaNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,packageName,capacity,transactionStatus,grossAmount,bankCode,bankName,bankImageUrl,vaNumber,createdAt,expiredAt);

@override
String toString() {
  return 'DetailTransactionDataModel(id: $id, orderId: $orderId, packageName: $packageName, capacity: $capacity, transactionStatus: $transactionStatus, grossAmount: $grossAmount, bankCode: $bankCode, bankName: $bankName, bankImageUrl: $bankImageUrl, vaNumber: $vaNumber, createdAt: $createdAt, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class _$DetailTransactionDataModelCopyWith<$Res> implements $DetailTransactionDataModelCopyWith<$Res> {
  factory _$DetailTransactionDataModelCopyWith(_DetailTransactionDataModel value, $Res Function(_DetailTransactionDataModel) _then) = __$DetailTransactionDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? orderId, String? packageName, String? capacity, String? transactionStatus, int? grossAmount, String? bankCode, String? bankName, String? bankImageUrl, String? vaNumber, DateTime? createdAt, DateTime? expiredAt
});




}
/// @nodoc
class __$DetailTransactionDataModelCopyWithImpl<$Res>
    implements _$DetailTransactionDataModelCopyWith<$Res> {
  __$DetailTransactionDataModelCopyWithImpl(this._self, this._then);

  final _DetailTransactionDataModel _self;
  final $Res Function(_DetailTransactionDataModel) _then;

/// Create a copy of DetailTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? packageName = freezed,Object? capacity = freezed,Object? transactionStatus = freezed,Object? grossAmount = freezed,Object? bankCode = freezed,Object? bankName = freezed,Object? bankImageUrl = freezed,Object? vaNumber = freezed,Object? createdAt = freezed,Object? expiredAt = freezed,}) {
  return _then(_DetailTransactionDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,transactionStatus: freezed == transactionStatus ? _self.transactionStatus : transactionStatus // ignore: cast_nullable_to_non_nullable
as String?,grossAmount: freezed == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as int?,bankCode: freezed == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankImageUrl: freezed == bankImageUrl ? _self.bankImageUrl : bankImageUrl // ignore: cast_nullable_to_non_nullable
as String?,vaNumber: freezed == vaNumber ? _self.vaNumber : vaNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
