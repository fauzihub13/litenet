// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FAQResponseModel {

 bool? get success; String? get message; List<FAQDataModel>? get data;
/// Create a copy of FAQResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FAQResponseModelCopyWith<FAQResponseModel> get copyWith => _$FAQResponseModelCopyWithImpl<FAQResponseModel>(this as FAQResponseModel, _$identity);

  /// Serializes this FAQResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAQResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FAQResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $FAQResponseModelCopyWith<$Res>  {
  factory $FAQResponseModelCopyWith(FAQResponseModel value, $Res Function(FAQResponseModel) _then) = _$FAQResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<FAQDataModel>? data
});




}
/// @nodoc
class _$FAQResponseModelCopyWithImpl<$Res>
    implements $FAQResponseModelCopyWith<$Res> {
  _$FAQResponseModelCopyWithImpl(this._self, this._then);

  final FAQResponseModel _self;
  final $Res Function(FAQResponseModel) _then;

/// Create a copy of FAQResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FAQDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FAQResponseModel].
extension FAQResponseModelPatterns on FAQResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FAQResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FAQResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FAQResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _FAQResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FAQResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _FAQResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<FAQDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FAQResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<FAQDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _FAQResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<FAQDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _FAQResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FAQResponseModel implements FAQResponseModel {
  const _FAQResponseModel({this.success, this.message, final  List<FAQDataModel>? data}): _data = data;
  factory _FAQResponseModel.fromJson(Map<String, dynamic> json) => _$FAQResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<FAQDataModel>? _data;
@override List<FAQDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FAQResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FAQResponseModelCopyWith<_FAQResponseModel> get copyWith => __$FAQResponseModelCopyWithImpl<_FAQResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FAQResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FAQResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'FAQResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$FAQResponseModelCopyWith<$Res> implements $FAQResponseModelCopyWith<$Res> {
  factory _$FAQResponseModelCopyWith(_FAQResponseModel value, $Res Function(_FAQResponseModel) _then) = __$FAQResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<FAQDataModel>? data
});




}
/// @nodoc
class __$FAQResponseModelCopyWithImpl<$Res>
    implements _$FAQResponseModelCopyWith<$Res> {
  __$FAQResponseModelCopyWithImpl(this._self, this._then);

  final _FAQResponseModel _self;
  final $Res Function(_FAQResponseModel) _then;

/// Create a copy of FAQResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_FAQResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FAQDataModel>?,
  ));
}


}


/// @nodoc
mixin _$FAQDataModel {

 String? get id; String? get slug; String? get title; String? get description; DateTime? get createdAt; DateTime? get updatedAt; dynamic get deletedAt;
/// Create a copy of FAQDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FAQDataModelCopyWith<FAQDataModel> get copyWith => _$FAQDataModelCopyWithImpl<FAQDataModel>(this as FAQDataModel, _$identity);

  /// Serializes this FAQDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAQDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'FAQDataModel(id: $id, slug: $slug, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $FAQDataModelCopyWith<$Res>  {
  factory $FAQDataModelCopyWith(FAQDataModel value, $Res Function(FAQDataModel) _then) = _$FAQDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? slug, String? title, String? description, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class _$FAQDataModelCopyWithImpl<$Res>
    implements $FAQDataModelCopyWith<$Res> {
  _$FAQDataModelCopyWithImpl(this._self, this._then);

  final FAQDataModel _self;
  final $Res Function(FAQDataModel) _then;

/// Create a copy of FAQDataModel
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


/// Adds pattern-matching-related methods to [FAQDataModel].
extension FAQDataModelPatterns on FAQDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FAQDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FAQDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FAQDataModel value)  $default,){
final _that = this;
switch (_that) {
case _FAQDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FAQDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _FAQDataModel() when $default != null:
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
case _FAQDataModel() when $default != null:
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
case _FAQDataModel():
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
case _FAQDataModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FAQDataModel implements FAQDataModel {
  const _FAQDataModel({this.id, this.slug, this.title, this.description, this.createdAt, this.updatedAt, this.deletedAt});
  factory _FAQDataModel.fromJson(Map<String, dynamic> json) => _$FAQDataModelFromJson(json);

@override final  String? id;
@override final  String? slug;
@override final  String? title;
@override final  String? description;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  dynamic deletedAt;

/// Create a copy of FAQDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FAQDataModelCopyWith<_FAQDataModel> get copyWith => __$FAQDataModelCopyWithImpl<_FAQDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FAQDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FAQDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'FAQDataModel(id: $id, slug: $slug, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$FAQDataModelCopyWith<$Res> implements $FAQDataModelCopyWith<$Res> {
  factory _$FAQDataModelCopyWith(_FAQDataModel value, $Res Function(_FAQDataModel) _then) = __$FAQDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? slug, String? title, String? description, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class __$FAQDataModelCopyWithImpl<$Res>
    implements _$FAQDataModelCopyWith<$Res> {
  __$FAQDataModelCopyWithImpl(this._self, this._then);

  final _FAQDataModel _self;
  final $Res Function(_FAQDataModel) _then;

/// Create a copy of FAQDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_FAQDataModel(
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
