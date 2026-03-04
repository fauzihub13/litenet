// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_and_policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacyAndPolicyResponseModel {

 bool? get success; String? get message; List<PrivacyAndPolicyDataModel>? get data;
/// Create a copy of PrivacyAndPolicyResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacyAndPolicyResponseModelCopyWith<PrivacyAndPolicyResponseModel> get copyWith => _$PrivacyAndPolicyResponseModelCopyWithImpl<PrivacyAndPolicyResponseModel>(this as PrivacyAndPolicyResponseModel, _$identity);

  /// Serializes this PrivacyAndPolicyResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyAndPolicyResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PrivacyAndPolicyResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $PrivacyAndPolicyResponseModelCopyWith<$Res>  {
  factory $PrivacyAndPolicyResponseModelCopyWith(PrivacyAndPolicyResponseModel value, $Res Function(PrivacyAndPolicyResponseModel) _then) = _$PrivacyAndPolicyResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<PrivacyAndPolicyDataModel>? data
});




}
/// @nodoc
class _$PrivacyAndPolicyResponseModelCopyWithImpl<$Res>
    implements $PrivacyAndPolicyResponseModelCopyWith<$Res> {
  _$PrivacyAndPolicyResponseModelCopyWithImpl(this._self, this._then);

  final PrivacyAndPolicyResponseModel _self;
  final $Res Function(PrivacyAndPolicyResponseModel) _then;

/// Create a copy of PrivacyAndPolicyResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PrivacyAndPolicyDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacyAndPolicyResponseModel].
extension PrivacyAndPolicyResponseModelPatterns on PrivacyAndPolicyResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacyAndPolicyResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacyAndPolicyResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacyAndPolicyResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PrivacyAndPolicyResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacyAndPolicyResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacyAndPolicyResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<PrivacyAndPolicyDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacyAndPolicyResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<PrivacyAndPolicyDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _PrivacyAndPolicyResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<PrivacyAndPolicyDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _PrivacyAndPolicyResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacyAndPolicyResponseModel implements PrivacyAndPolicyResponseModel {
  const _PrivacyAndPolicyResponseModel({this.success, this.message, final  List<PrivacyAndPolicyDataModel>? data}): _data = data;
  factory _PrivacyAndPolicyResponseModel.fromJson(Map<String, dynamic> json) => _$PrivacyAndPolicyResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<PrivacyAndPolicyDataModel>? _data;
@override List<PrivacyAndPolicyDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PrivacyAndPolicyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacyAndPolicyResponseModelCopyWith<_PrivacyAndPolicyResponseModel> get copyWith => __$PrivacyAndPolicyResponseModelCopyWithImpl<_PrivacyAndPolicyResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacyAndPolicyResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacyAndPolicyResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PrivacyAndPolicyResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PrivacyAndPolicyResponseModelCopyWith<$Res> implements $PrivacyAndPolicyResponseModelCopyWith<$Res> {
  factory _$PrivacyAndPolicyResponseModelCopyWith(_PrivacyAndPolicyResponseModel value, $Res Function(_PrivacyAndPolicyResponseModel) _then) = __$PrivacyAndPolicyResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<PrivacyAndPolicyDataModel>? data
});




}
/// @nodoc
class __$PrivacyAndPolicyResponseModelCopyWithImpl<$Res>
    implements _$PrivacyAndPolicyResponseModelCopyWith<$Res> {
  __$PrivacyAndPolicyResponseModelCopyWithImpl(this._self, this._then);

  final _PrivacyAndPolicyResponseModel _self;
  final $Res Function(_PrivacyAndPolicyResponseModel) _then;

/// Create a copy of PrivacyAndPolicyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_PrivacyAndPolicyResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PrivacyAndPolicyDataModel>?,
  ));
}


}


/// @nodoc
mixin _$PrivacyAndPolicyDataModel {

 String? get id; String? get slug; String? get title; String? get description; DateTime? get createdAt; DateTime? get updatedAt; dynamic get deletedAt;
/// Create a copy of PrivacyAndPolicyDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacyAndPolicyDataModelCopyWith<PrivacyAndPolicyDataModel> get copyWith => _$PrivacyAndPolicyDataModelCopyWithImpl<PrivacyAndPolicyDataModel>(this as PrivacyAndPolicyDataModel, _$identity);

  /// Serializes this PrivacyAndPolicyDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyAndPolicyDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'PrivacyAndPolicyDataModel(id: $id, slug: $slug, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $PrivacyAndPolicyDataModelCopyWith<$Res>  {
  factory $PrivacyAndPolicyDataModelCopyWith(PrivacyAndPolicyDataModel value, $Res Function(PrivacyAndPolicyDataModel) _then) = _$PrivacyAndPolicyDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? slug, String? title, String? description, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class _$PrivacyAndPolicyDataModelCopyWithImpl<$Res>
    implements $PrivacyAndPolicyDataModelCopyWith<$Res> {
  _$PrivacyAndPolicyDataModelCopyWithImpl(this._self, this._then);

  final PrivacyAndPolicyDataModel _self;
  final $Res Function(PrivacyAndPolicyDataModel) _then;

/// Create a copy of PrivacyAndPolicyDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacyAndPolicyDataModel].
extension PrivacyAndPolicyDataModelPatterns on PrivacyAndPolicyDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacyAndPolicyDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacyAndPolicyDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacyAndPolicyDataModel value)  $default,){
final _that = this;
switch (_that) {
case _PrivacyAndPolicyDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacyAndPolicyDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacyAndPolicyDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? slug,  String? title,  String? description,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacyAndPolicyDataModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? slug,  String? title,  String? description,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)  $default,) {final _that = this;
switch (_that) {
case _PrivacyAndPolicyDataModel():
return $default(_that.id,_that.slug,_that.title,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? slug,  String? title,  String? description,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _PrivacyAndPolicyDataModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacyAndPolicyDataModel implements PrivacyAndPolicyDataModel {
  const _PrivacyAndPolicyDataModel({this.id, this.slug, this.title, this.description, this.createdAt, this.updatedAt, this.deletedAt});
  factory _PrivacyAndPolicyDataModel.fromJson(Map<String, dynamic> json) => _$PrivacyAndPolicyDataModelFromJson(json);

@override final  String? id;
@override final  String? slug;
@override final  String? title;
@override final  String? description;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  dynamic deletedAt;

/// Create a copy of PrivacyAndPolicyDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacyAndPolicyDataModelCopyWith<_PrivacyAndPolicyDataModel> get copyWith => __$PrivacyAndPolicyDataModelCopyWithImpl<_PrivacyAndPolicyDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacyAndPolicyDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacyAndPolicyDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'PrivacyAndPolicyDataModel(id: $id, slug: $slug, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$PrivacyAndPolicyDataModelCopyWith<$Res> implements $PrivacyAndPolicyDataModelCopyWith<$Res> {
  factory _$PrivacyAndPolicyDataModelCopyWith(_PrivacyAndPolicyDataModel value, $Res Function(_PrivacyAndPolicyDataModel) _then) = __$PrivacyAndPolicyDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? slug, String? title, String? description, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class __$PrivacyAndPolicyDataModelCopyWithImpl<$Res>
    implements _$PrivacyAndPolicyDataModelCopyWith<$Res> {
  __$PrivacyAndPolicyDataModelCopyWithImpl(this._self, this._then);

  final _PrivacyAndPolicyDataModel _self;
  final $Res Function(_PrivacyAndPolicyDataModel) _then;

/// Create a copy of PrivacyAndPolicyDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_PrivacyAndPolicyDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
