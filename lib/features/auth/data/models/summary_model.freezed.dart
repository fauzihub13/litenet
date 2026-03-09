// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummaryResponseModel {

 bool? get success; String? get message; SummaryDataModel? get data;
/// Create a copy of SummaryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryResponseModelCopyWith<SummaryResponseModel> get copyWith => _$SummaryResponseModelCopyWithImpl<SummaryResponseModel>(this as SummaryResponseModel, _$identity);

  /// Serializes this SummaryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SummaryResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SummaryResponseModelCopyWith<$Res>  {
  factory $SummaryResponseModelCopyWith(SummaryResponseModel value, $Res Function(SummaryResponseModel) _then) = _$SummaryResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, SummaryDataModel? data
});


$SummaryDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$SummaryResponseModelCopyWithImpl<$Res>
    implements $SummaryResponseModelCopyWith<$Res> {
  _$SummaryResponseModelCopyWithImpl(this._self, this._then);

  final SummaryResponseModel _self;
  final $Res Function(SummaryResponseModel) _then;

/// Create a copy of SummaryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SummaryDataModel?,
  ));
}
/// Create a copy of SummaryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SummaryDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SummaryResponseModel].
extension SummaryResponseModelPatterns on SummaryResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SummaryResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  SummaryDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  SummaryDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _SummaryResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  SummaryDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _SummaryResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryResponseModel implements SummaryResponseModel {
  const _SummaryResponseModel({this.success, this.message, this.data});
  factory _SummaryResponseModel.fromJson(Map<String, dynamic> json) => _$SummaryResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  SummaryDataModel? data;

/// Create a copy of SummaryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryResponseModelCopyWith<_SummaryResponseModel> get copyWith => __$SummaryResponseModelCopyWithImpl<_SummaryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SummaryResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SummaryResponseModelCopyWith<$Res> implements $SummaryResponseModelCopyWith<$Res> {
  factory _$SummaryResponseModelCopyWith(_SummaryResponseModel value, $Res Function(_SummaryResponseModel) _then) = __$SummaryResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, SummaryDataModel? data
});


@override $SummaryDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$SummaryResponseModelCopyWithImpl<$Res>
    implements _$SummaryResponseModelCopyWith<$Res> {
  __$SummaryResponseModelCopyWithImpl(this._self, this._then);

  final _SummaryResponseModel _self;
  final $Res Function(_SummaryResponseModel) _then;

/// Create a copy of SummaryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_SummaryResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SummaryDataModel?,
  ));
}

/// Create a copy of SummaryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SummaryDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SummaryDataModel {

 int? get totalDevice; String? get totalQuota; String? get totalUsage;
/// Create a copy of SummaryDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryDataModelCopyWith<SummaryDataModel> get copyWith => _$SummaryDataModelCopyWithImpl<SummaryDataModel>(this as SummaryDataModel, _$identity);

  /// Serializes this SummaryDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryDataModel&&(identical(other.totalDevice, totalDevice) || other.totalDevice == totalDevice)&&(identical(other.totalQuota, totalQuota) || other.totalQuota == totalQuota)&&(identical(other.totalUsage, totalUsage) || other.totalUsage == totalUsage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDevice,totalQuota,totalUsage);

@override
String toString() {
  return 'SummaryDataModel(totalDevice: $totalDevice, totalQuota: $totalQuota, totalUsage: $totalUsage)';
}


}

/// @nodoc
abstract mixin class $SummaryDataModelCopyWith<$Res>  {
  factory $SummaryDataModelCopyWith(SummaryDataModel value, $Res Function(SummaryDataModel) _then) = _$SummaryDataModelCopyWithImpl;
@useResult
$Res call({
 int? totalDevice, String? totalQuota, String? totalUsage
});




}
/// @nodoc
class _$SummaryDataModelCopyWithImpl<$Res>
    implements $SummaryDataModelCopyWith<$Res> {
  _$SummaryDataModelCopyWithImpl(this._self, this._then);

  final SummaryDataModel _self;
  final $Res Function(SummaryDataModel) _then;

/// Create a copy of SummaryDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDevice = freezed,Object? totalQuota = freezed,Object? totalUsage = freezed,}) {
  return _then(_self.copyWith(
totalDevice: freezed == totalDevice ? _self.totalDevice : totalDevice // ignore: cast_nullable_to_non_nullable
as int?,totalQuota: freezed == totalQuota ? _self.totalQuota : totalQuota // ignore: cast_nullable_to_non_nullable
as String?,totalUsage: freezed == totalUsage ? _self.totalUsage : totalUsage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryDataModel].
extension SummaryDataModelPatterns on SummaryDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryDataModel value)  $default,){
final _that = this;
switch (_that) {
case _SummaryDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? totalDevice,  String? totalQuota,  String? totalUsage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryDataModel() when $default != null:
return $default(_that.totalDevice,_that.totalQuota,_that.totalUsage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? totalDevice,  String? totalQuota,  String? totalUsage)  $default,) {final _that = this;
switch (_that) {
case _SummaryDataModel():
return $default(_that.totalDevice,_that.totalQuota,_that.totalUsage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? totalDevice,  String? totalQuota,  String? totalUsage)?  $default,) {final _that = this;
switch (_that) {
case _SummaryDataModel() when $default != null:
return $default(_that.totalDevice,_that.totalQuota,_that.totalUsage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryDataModel implements SummaryDataModel {
  const _SummaryDataModel({this.totalDevice, this.totalQuota, this.totalUsage});
  factory _SummaryDataModel.fromJson(Map<String, dynamic> json) => _$SummaryDataModelFromJson(json);

@override final  int? totalDevice;
@override final  String? totalQuota;
@override final  String? totalUsage;

/// Create a copy of SummaryDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryDataModelCopyWith<_SummaryDataModel> get copyWith => __$SummaryDataModelCopyWithImpl<_SummaryDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryDataModel&&(identical(other.totalDevice, totalDevice) || other.totalDevice == totalDevice)&&(identical(other.totalQuota, totalQuota) || other.totalQuota == totalQuota)&&(identical(other.totalUsage, totalUsage) || other.totalUsage == totalUsage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDevice,totalQuota,totalUsage);

@override
String toString() {
  return 'SummaryDataModel(totalDevice: $totalDevice, totalQuota: $totalQuota, totalUsage: $totalUsage)';
}


}

/// @nodoc
abstract mixin class _$SummaryDataModelCopyWith<$Res> implements $SummaryDataModelCopyWith<$Res> {
  factory _$SummaryDataModelCopyWith(_SummaryDataModel value, $Res Function(_SummaryDataModel) _then) = __$SummaryDataModelCopyWithImpl;
@override @useResult
$Res call({
 int? totalDevice, String? totalQuota, String? totalUsage
});




}
/// @nodoc
class __$SummaryDataModelCopyWithImpl<$Res>
    implements _$SummaryDataModelCopyWith<$Res> {
  __$SummaryDataModelCopyWithImpl(this._self, this._then);

  final _SummaryDataModel _self;
  final $Res Function(_SummaryDataModel) _then;

/// Create a copy of SummaryDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDevice = freezed,Object? totalQuota = freezed,Object? totalUsage = freezed,}) {
  return _then(_SummaryDataModel(
totalDevice: freezed == totalDevice ? _self.totalDevice : totalDevice // ignore: cast_nullable_to_non_nullable
as int?,totalQuota: freezed == totalQuota ? _self.totalQuota : totalQuota // ignore: cast_nullable_to_non_nullable
as String?,totalUsage: freezed == totalUsage ? _self.totalUsage : totalUsage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
