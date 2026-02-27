// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
LogoutResponseModel _$LogoutResponseModelFromJson(
  Map<String, dynamic> json
) {
    return _Logout.fromJson(
      json
    );
}

/// @nodoc
mixin _$LogoutResponseModel {

 bool? get success; String? get message;
/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutResponseModelCopyWith<LogoutResponseModel> get copyWith => _$LogoutResponseModelCopyWithImpl<LogoutResponseModel>(this as LogoutResponseModel, _$identity);

  /// Serializes this LogoutResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutResponseModelCopyWith<$Res>  {
  factory $LogoutResponseModelCopyWith(LogoutResponseModel value, $Res Function(LogoutResponseModel) _then) = _$LogoutResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message
});




}
/// @nodoc
class _$LogoutResponseModelCopyWithImpl<$Res>
    implements $LogoutResponseModelCopyWith<$Res> {
  _$LogoutResponseModelCopyWithImpl(this._self, this._then);

  final LogoutResponseModel _self;
  final $Res Function(LogoutResponseModel) _then;

/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutResponseModel].
extension LogoutResponseModelPatterns on LogoutResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Logout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Logout() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Logout value)  $default,){
final _that = this;
switch (_that) {
case _Logout():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Logout value)?  $default,){
final _that = this;
switch (_that) {
case _Logout() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Logout() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message)  $default,) {final _that = this;
switch (_that) {
case _Logout():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _Logout() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Logout implements LogoutResponseModel {
  const _Logout({this.success, this.message});
  factory _Logout.fromJson(Map<String, dynamic> json) => _$LogoutFromJson(json);

@override final  bool? success;
@override final  String? message;

/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutCopyWith<_Logout> get copyWith => __$LogoutCopyWithImpl<_Logout>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LogoutCopyWith<$Res> implements $LogoutResponseModelCopyWith<$Res> {
  factory _$LogoutCopyWith(_Logout value, $Res Function(_Logout) _then) = __$LogoutCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message
});




}
/// @nodoc
class __$LogoutCopyWithImpl<$Res>
    implements _$LogoutCopyWith<$Res> {
  __$LogoutCopyWithImpl(this._self, this._then);

  final _Logout _self;
  final $Res Function(_Logout) _then;

/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,}) {
  return _then(_Logout(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
