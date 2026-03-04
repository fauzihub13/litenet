// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ChangePasswordResponseModel _$ChangePasswordResponseModelFromJson(
  Map<String, dynamic> json
) {
    return _ChangePassword.fromJson(
      json
    );
}

/// @nodoc
mixin _$ChangePasswordResponseModel {

 bool? get success; String? get message;
/// Create a copy of ChangePasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordResponseModelCopyWith<ChangePasswordResponseModel> get copyWith => _$ChangePasswordResponseModelCopyWithImpl<ChangePasswordResponseModel>(this as ChangePasswordResponseModel, _$identity);

  /// Serializes this ChangePasswordResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'ChangePasswordResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordResponseModelCopyWith<$Res>  {
  factory $ChangePasswordResponseModelCopyWith(ChangePasswordResponseModel value, $Res Function(ChangePasswordResponseModel) _then) = _$ChangePasswordResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message
});




}
/// @nodoc
class _$ChangePasswordResponseModelCopyWithImpl<$Res>
    implements $ChangePasswordResponseModelCopyWith<$Res> {
  _$ChangePasswordResponseModelCopyWithImpl(this._self, this._then);

  final ChangePasswordResponseModel _self;
  final $Res Function(ChangePasswordResponseModel) _then;

/// Create a copy of ChangePasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordResponseModel].
extension ChangePasswordResponseModelPatterns on ChangePasswordResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePassword value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePassword() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePassword value)  $default,){
final _that = this;
switch (_that) {
case _ChangePassword():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePassword value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePassword() when $default != null:
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
case _ChangePassword() when $default != null:
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
case _ChangePassword():
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
case _ChangePassword() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangePassword implements ChangePasswordResponseModel {
  const _ChangePassword({this.success, this.message});
  factory _ChangePassword.fromJson(Map<String, dynamic> json) => _$ChangePasswordFromJson(json);

@override final  bool? success;
@override final  String? message;

/// Create a copy of ChangePasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordCopyWith<_ChangePassword> get copyWith => __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePassword&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'ChangePasswordResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordCopyWith<$Res> implements $ChangePasswordResponseModelCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(_ChangePassword value, $Res Function(_ChangePassword) _then) = __$ChangePasswordCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message
});




}
/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(this._self, this._then);

  final _ChangePassword _self;
  final $Res Function(_ChangePassword) _then;

/// Create a copy of ChangePasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,}) {
  return _then(_ChangePassword(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
