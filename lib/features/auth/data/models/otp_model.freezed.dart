// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
OTPResponseModel _$OTPResponseModelFromJson(
  Map<String, dynamic> json
) {
    return _OTP.fromJson(
      json
    );
}

/// @nodoc
mixin _$OTPResponseModel {

 bool? get success; String? get message; OTPDataModel? get data;
/// Create a copy of OTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OTPResponseModelCopyWith<OTPResponseModel> get copyWith => _$OTPResponseModelCopyWithImpl<OTPResponseModel>(this as OTPResponseModel, _$identity);

  /// Serializes this OTPResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OTPResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'OTPResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $OTPResponseModelCopyWith<$Res>  {
  factory $OTPResponseModelCopyWith(OTPResponseModel value, $Res Function(OTPResponseModel) _then) = _$OTPResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, OTPDataModel? data
});


$OTPDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$OTPResponseModelCopyWithImpl<$Res>
    implements $OTPResponseModelCopyWith<$Res> {
  _$OTPResponseModelCopyWithImpl(this._self, this._then);

  final OTPResponseModel _self;
  final $Res Function(OTPResponseModel) _then;

/// Create a copy of OTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OTPDataModel?,
  ));
}
/// Create a copy of OTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OTPDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OTPDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [OTPResponseModel].
extension OTPResponseModelPatterns on OTPResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OTP value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OTP() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OTP value)  $default,){
final _that = this;
switch (_that) {
case _OTP():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OTP value)?  $default,){
final _that = this;
switch (_that) {
case _OTP() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  OTPDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OTP() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  OTPDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _OTP():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  OTPDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _OTP() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OTP implements OTPResponseModel {
  const _OTP({this.success, this.message, this.data});
  factory _OTP.fromJson(Map<String, dynamic> json) => _$OTPFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  OTPDataModel? data;

/// Create a copy of OTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OTPCopyWith<_OTP> get copyWith => __$OTPCopyWithImpl<_OTP>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OTPToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OTP&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'OTPResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OTPCopyWith<$Res> implements $OTPResponseModelCopyWith<$Res> {
  factory _$OTPCopyWith(_OTP value, $Res Function(_OTP) _then) = __$OTPCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, OTPDataModel? data
});


@override $OTPDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$OTPCopyWithImpl<$Res>
    implements _$OTPCopyWith<$Res> {
  __$OTPCopyWithImpl(this._self, this._then);

  final _OTP _self;
  final $Res Function(_OTP) _then;

/// Create a copy of OTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_OTP(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OTPDataModel?,
  ));
}

/// Create a copy of OTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OTPDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OTPDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$OTPDataModel {

 UserModel? get user; bool? get isVerified; String? get token;
/// Create a copy of OTPDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OTPDataModelCopyWith<OTPDataModel> get copyWith => _$OTPDataModelCopyWithImpl<OTPDataModel>(this as OTPDataModel, _$identity);

  /// Serializes this OTPDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OTPDataModel&&(identical(other.user, user) || other.user == user)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,isVerified,token);

@override
String toString() {
  return 'OTPDataModel(user: $user, isVerified: $isVerified, token: $token)';
}


}

/// @nodoc
abstract mixin class $OTPDataModelCopyWith<$Res>  {
  factory $OTPDataModelCopyWith(OTPDataModel value, $Res Function(OTPDataModel) _then) = _$OTPDataModelCopyWithImpl;
@useResult
$Res call({
 UserModel? user, bool? isVerified, String? token
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$OTPDataModelCopyWithImpl<$Res>
    implements $OTPDataModelCopyWith<$Res> {
  _$OTPDataModelCopyWithImpl(this._self, this._then);

  final OTPDataModel _self;
  final $Res Function(OTPDataModel) _then;

/// Create a copy of OTPDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? isVerified = freezed,Object? token = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OTPDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [OTPDataModel].
extension OTPDataModelPatterns on OTPDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OTPDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OTPDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OTPDataModel value)  $default,){
final _that = this;
switch (_that) {
case _OTPDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OTPDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _OTPDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel? user,  bool? isVerified,  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OTPDataModel() when $default != null:
return $default(_that.user,_that.isVerified,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel? user,  bool? isVerified,  String? token)  $default,) {final _that = this;
switch (_that) {
case _OTPDataModel():
return $default(_that.user,_that.isVerified,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel? user,  bool? isVerified,  String? token)?  $default,) {final _that = this;
switch (_that) {
case _OTPDataModel() when $default != null:
return $default(_that.user,_that.isVerified,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OTPDataModel implements OTPDataModel {
  const _OTPDataModel({this.user, this.isVerified, this.token});
  factory _OTPDataModel.fromJson(Map<String, dynamic> json) => _$OTPDataModelFromJson(json);

@override final  UserModel? user;
@override final  bool? isVerified;
@override final  String? token;

/// Create a copy of OTPDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OTPDataModelCopyWith<_OTPDataModel> get copyWith => __$OTPDataModelCopyWithImpl<_OTPDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OTPDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OTPDataModel&&(identical(other.user, user) || other.user == user)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,isVerified,token);

@override
String toString() {
  return 'OTPDataModel(user: $user, isVerified: $isVerified, token: $token)';
}


}

/// @nodoc
abstract mixin class _$OTPDataModelCopyWith<$Res> implements $OTPDataModelCopyWith<$Res> {
  factory _$OTPDataModelCopyWith(_OTPDataModel value, $Res Function(_OTPDataModel) _then) = __$OTPDataModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel? user, bool? isVerified, String? token
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$OTPDataModelCopyWithImpl<$Res>
    implements _$OTPDataModelCopyWith<$Res> {
  __$OTPDataModelCopyWithImpl(this._self, this._then);

  final _OTPDataModel _self;
  final $Res Function(_OTPDataModel) _then;

/// Create a copy of OTPDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? isVerified = freezed,Object? token = freezed,}) {
  return _then(_OTPDataModel(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OTPDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
