// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_promo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckPromoResponseModel {

 bool? get success; String? get message; PromoDataModel? get data;
/// Create a copy of CheckPromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPromoResponseModelCopyWith<CheckPromoResponseModel> get copyWith => _$CheckPromoResponseModelCopyWithImpl<CheckPromoResponseModel>(this as CheckPromoResponseModel, _$identity);

  /// Serializes this CheckPromoResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPromoResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CheckPromoResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CheckPromoResponseModelCopyWith<$Res>  {
  factory $CheckPromoResponseModelCopyWith(CheckPromoResponseModel value, $Res Function(CheckPromoResponseModel) _then) = _$CheckPromoResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, PromoDataModel? data
});


$PromoDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$CheckPromoResponseModelCopyWithImpl<$Res>
    implements $CheckPromoResponseModelCopyWith<$Res> {
  _$CheckPromoResponseModelCopyWithImpl(this._self, this._then);

  final CheckPromoResponseModel _self;
  final $Res Function(CheckPromoResponseModel) _then;

/// Create a copy of CheckPromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PromoDataModel?,
  ));
}
/// Create a copy of CheckPromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromoDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PromoDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckPromoResponseModel].
extension CheckPromoResponseModelPatterns on CheckPromoResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckPromoResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckPromoResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckPromoResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CheckPromoResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckPromoResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CheckPromoResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  PromoDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckPromoResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  PromoDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _CheckPromoResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  PromoDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _CheckPromoResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckPromoResponseModel implements CheckPromoResponseModel {
  const _CheckPromoResponseModel({this.success, this.message, this.data});
  factory _CheckPromoResponseModel.fromJson(Map<String, dynamic> json) => _$CheckPromoResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  PromoDataModel? data;

/// Create a copy of CheckPromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckPromoResponseModelCopyWith<_CheckPromoResponseModel> get copyWith => __$CheckPromoResponseModelCopyWithImpl<_CheckPromoResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckPromoResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckPromoResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CheckPromoResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CheckPromoResponseModelCopyWith<$Res> implements $CheckPromoResponseModelCopyWith<$Res> {
  factory _$CheckPromoResponseModelCopyWith(_CheckPromoResponseModel value, $Res Function(_CheckPromoResponseModel) _then) = __$CheckPromoResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, PromoDataModel? data
});


@override $PromoDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$CheckPromoResponseModelCopyWithImpl<$Res>
    implements _$CheckPromoResponseModelCopyWith<$Res> {
  __$CheckPromoResponseModelCopyWithImpl(this._self, this._then);

  final _CheckPromoResponseModel _self;
  final $Res Function(_CheckPromoResponseModel) _then;

/// Create a copy of CheckPromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CheckPromoResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PromoDataModel?,
  ));
}

/// Create a copy of CheckPromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromoDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PromoDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
