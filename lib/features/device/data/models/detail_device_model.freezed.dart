// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailDeviceResponseModel {

 bool? get success; String? get message; DeviceDataModel? get data;
/// Create a copy of DetailDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailDeviceResponseModelCopyWith<DetailDeviceResponseModel> get copyWith => _$DetailDeviceResponseModelCopyWithImpl<DetailDeviceResponseModel>(this as DetailDeviceResponseModel, _$identity);

  /// Serializes this DetailDeviceResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailDeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DetailDeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DetailDeviceResponseModelCopyWith<$Res>  {
  factory $DetailDeviceResponseModelCopyWith(DetailDeviceResponseModel value, $Res Function(DetailDeviceResponseModel) _then) = _$DetailDeviceResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, DeviceDataModel? data
});


$DeviceDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$DetailDeviceResponseModelCopyWithImpl<$Res>
    implements $DetailDeviceResponseModelCopyWith<$Res> {
  _$DetailDeviceResponseModelCopyWithImpl(this._self, this._then);

  final DetailDeviceResponseModel _self;
  final $Res Function(DetailDeviceResponseModel) _then;

/// Create a copy of DetailDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DeviceDataModel?,
  ));
}
/// Create a copy of DetailDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DeviceDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailDeviceResponseModel].
extension DetailDeviceResponseModelPatterns on DetailDeviceResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailDeviceResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailDeviceResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailDeviceResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailDeviceResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  DeviceDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailDeviceResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  DeviceDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _DetailDeviceResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  DeviceDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _DetailDeviceResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailDeviceResponseModel implements DetailDeviceResponseModel {
  const _DetailDeviceResponseModel({this.success, this.message, this.data});
  factory _DetailDeviceResponseModel.fromJson(Map<String, dynamic> json) => _$DetailDeviceResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  DeviceDataModel? data;

/// Create a copy of DetailDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailDeviceResponseModelCopyWith<_DetailDeviceResponseModel> get copyWith => __$DetailDeviceResponseModelCopyWithImpl<_DetailDeviceResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailDeviceResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailDeviceResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DetailDeviceResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DetailDeviceResponseModelCopyWith<$Res> implements $DetailDeviceResponseModelCopyWith<$Res> {
  factory _$DetailDeviceResponseModelCopyWith(_DetailDeviceResponseModel value, $Res Function(_DetailDeviceResponseModel) _then) = __$DetailDeviceResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, DeviceDataModel? data
});


@override $DeviceDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$DetailDeviceResponseModelCopyWithImpl<$Res>
    implements _$DetailDeviceResponseModelCopyWith<$Res> {
  __$DetailDeviceResponseModelCopyWithImpl(this._self, this._then);

  final _DetailDeviceResponseModel _self;
  final $Res Function(_DetailDeviceResponseModel) _then;

/// Create a copy of DetailDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_DetailDeviceResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DeviceDataModel?,
  ));
}

/// Create a copy of DetailDeviceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DeviceDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
