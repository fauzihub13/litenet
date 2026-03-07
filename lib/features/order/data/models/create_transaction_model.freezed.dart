// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTransactionResponseModel {

 bool? get success; String? get message; CreateTransactionDataModel? get data;
/// Create a copy of CreateTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionResponseModelCopyWith<CreateTransactionResponseModel> get copyWith => _$CreateTransactionResponseModelCopyWithImpl<CreateTransactionResponseModel>(this as CreateTransactionResponseModel, _$identity);

  /// Serializes this CreateTransactionResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CreateTransactionResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionResponseModelCopyWith<$Res>  {
  factory $CreateTransactionResponseModelCopyWith(CreateTransactionResponseModel value, $Res Function(CreateTransactionResponseModel) _then) = _$CreateTransactionResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, CreateTransactionDataModel? data
});


$CreateTransactionDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$CreateTransactionResponseModelCopyWithImpl<$Res>
    implements $CreateTransactionResponseModelCopyWith<$Res> {
  _$CreateTransactionResponseModelCopyWithImpl(this._self, this._then);

  final CreateTransactionResponseModel _self;
  final $Res Function(CreateTransactionResponseModel) _then;

/// Create a copy of CreateTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateTransactionDataModel?,
  ));
}
/// Create a copy of CreateTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransactionDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CreateTransactionDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateTransactionResponseModel].
extension CreateTransactionResponseModelPatterns on CreateTransactionResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  CreateTransactionDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  CreateTransactionDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  CreateTransactionDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransactionResponseModel implements CreateTransactionResponseModel {
  const _CreateTransactionResponseModel({this.success, this.message, this.data});
  factory _CreateTransactionResponseModel.fromJson(Map<String, dynamic> json) => _$CreateTransactionResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  CreateTransactionDataModel? data;

/// Create a copy of CreateTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionResponseModelCopyWith<_CreateTransactionResponseModel> get copyWith => __$CreateTransactionResponseModelCopyWithImpl<_CreateTransactionResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransactionResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CreateTransactionResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionResponseModelCopyWith<$Res> implements $CreateTransactionResponseModelCopyWith<$Res> {
  factory _$CreateTransactionResponseModelCopyWith(_CreateTransactionResponseModel value, $Res Function(_CreateTransactionResponseModel) _then) = __$CreateTransactionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, CreateTransactionDataModel? data
});


@override $CreateTransactionDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$CreateTransactionResponseModelCopyWithImpl<$Res>
    implements _$CreateTransactionResponseModelCopyWith<$Res> {
  __$CreateTransactionResponseModelCopyWithImpl(this._self, this._then);

  final _CreateTransactionResponseModel _self;
  final $Res Function(_CreateTransactionResponseModel) _then;

/// Create a copy of CreateTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CreateTransactionResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateTransactionDataModel?,
  ));
}

/// Create a copy of CreateTransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransactionDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CreateTransactionDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CreateTransactionDataModel {

 String? get orderId; int? get amount; String? get paymentType; String? get bank; String? get imageUrl; String? get vaNumber; DateTime? get expiredAt;
/// Create a copy of CreateTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionDataModelCopyWith<CreateTransactionDataModel> get copyWith => _$CreateTransactionDataModelCopyWithImpl<CreateTransactionDataModel>(this as CreateTransactionDataModel, _$identity);

  /// Serializes this CreateTransactionDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionDataModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vaNumber, vaNumber) || other.vaNumber == vaNumber)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,amount,paymentType,bank,imageUrl,vaNumber,expiredAt);

@override
String toString() {
  return 'CreateTransactionDataModel(orderId: $orderId, amount: $amount, paymentType: $paymentType, bank: $bank, imageUrl: $imageUrl, vaNumber: $vaNumber, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionDataModelCopyWith<$Res>  {
  factory $CreateTransactionDataModelCopyWith(CreateTransactionDataModel value, $Res Function(CreateTransactionDataModel) _then) = _$CreateTransactionDataModelCopyWithImpl;
@useResult
$Res call({
 String? orderId, int? amount, String? paymentType, String? bank, String? imageUrl, String? vaNumber, DateTime? expiredAt
});




}
/// @nodoc
class _$CreateTransactionDataModelCopyWithImpl<$Res>
    implements $CreateTransactionDataModelCopyWith<$Res> {
  _$CreateTransactionDataModelCopyWithImpl(this._self, this._then);

  final CreateTransactionDataModel _self;
  final $Res Function(CreateTransactionDataModel) _then;

/// Create a copy of CreateTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = freezed,Object? amount = freezed,Object? paymentType = freezed,Object? bank = freezed,Object? imageUrl = freezed,Object? vaNumber = freezed,Object? expiredAt = freezed,}) {
  return _then(_self.copyWith(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vaNumber: freezed == vaNumber ? _self.vaNumber : vaNumber // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransactionDataModel].
extension CreateTransactionDataModelPatterns on CreateTransactionDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? orderId,  int? amount,  String? paymentType,  String? bank,  String? imageUrl,  String? vaNumber,  DateTime? expiredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionDataModel() when $default != null:
return $default(_that.orderId,_that.amount,_that.paymentType,_that.bank,_that.imageUrl,_that.vaNumber,_that.expiredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? orderId,  int? amount,  String? paymentType,  String? bank,  String? imageUrl,  String? vaNumber,  DateTime? expiredAt)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionDataModel():
return $default(_that.orderId,_that.amount,_that.paymentType,_that.bank,_that.imageUrl,_that.vaNumber,_that.expiredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? orderId,  int? amount,  String? paymentType,  String? bank,  String? imageUrl,  String? vaNumber,  DateTime? expiredAt)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionDataModel() when $default != null:
return $default(_that.orderId,_that.amount,_that.paymentType,_that.bank,_that.imageUrl,_that.vaNumber,_that.expiredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransactionDataModel implements CreateTransactionDataModel {
  const _CreateTransactionDataModel({this.orderId, this.amount, this.paymentType, this.bank, this.imageUrl, this.vaNumber, this.expiredAt});
  factory _CreateTransactionDataModel.fromJson(Map<String, dynamic> json) => _$CreateTransactionDataModelFromJson(json);

@override final  String? orderId;
@override final  int? amount;
@override final  String? paymentType;
@override final  String? bank;
@override final  String? imageUrl;
@override final  String? vaNumber;
@override final  DateTime? expiredAt;

/// Create a copy of CreateTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionDataModelCopyWith<_CreateTransactionDataModel> get copyWith => __$CreateTransactionDataModelCopyWithImpl<_CreateTransactionDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransactionDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionDataModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vaNumber, vaNumber) || other.vaNumber == vaNumber)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,amount,paymentType,bank,imageUrl,vaNumber,expiredAt);

@override
String toString() {
  return 'CreateTransactionDataModel(orderId: $orderId, amount: $amount, paymentType: $paymentType, bank: $bank, imageUrl: $imageUrl, vaNumber: $vaNumber, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionDataModelCopyWith<$Res> implements $CreateTransactionDataModelCopyWith<$Res> {
  factory _$CreateTransactionDataModelCopyWith(_CreateTransactionDataModel value, $Res Function(_CreateTransactionDataModel) _then) = __$CreateTransactionDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? orderId, int? amount, String? paymentType, String? bank, String? imageUrl, String? vaNumber, DateTime? expiredAt
});




}
/// @nodoc
class __$CreateTransactionDataModelCopyWithImpl<$Res>
    implements _$CreateTransactionDataModelCopyWith<$Res> {
  __$CreateTransactionDataModelCopyWithImpl(this._self, this._then);

  final _CreateTransactionDataModel _self;
  final $Res Function(_CreateTransactionDataModel) _then;

/// Create a copy of CreateTransactionDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = freezed,Object? amount = freezed,Object? paymentType = freezed,Object? bank = freezed,Object? imageUrl = freezed,Object? vaNumber = freezed,Object? expiredAt = freezed,}) {
  return _then(_CreateTransactionDataModel(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vaNumber: freezed == vaNumber ? _self.vaNumber : vaNumber // ignore: cast_nullable_to_non_nullable
as String?,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
