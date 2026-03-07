// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodResponseModel {

 bool? get success; String? get message; List<PaymentMethodDataModel>? get data;
/// Create a copy of PaymentMethodResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodResponseModelCopyWith<PaymentMethodResponseModel> get copyWith => _$PaymentMethodResponseModelCopyWithImpl<PaymentMethodResponseModel>(this as PaymentMethodResponseModel, _$identity);

  /// Serializes this PaymentMethodResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PaymentMethodResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodResponseModelCopyWith<$Res>  {
  factory $PaymentMethodResponseModelCopyWith(PaymentMethodResponseModel value, $Res Function(PaymentMethodResponseModel) _then) = _$PaymentMethodResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<PaymentMethodDataModel>? data
});




}
/// @nodoc
class _$PaymentMethodResponseModelCopyWithImpl<$Res>
    implements $PaymentMethodResponseModelCopyWith<$Res> {
  _$PaymentMethodResponseModelCopyWithImpl(this._self, this._then);

  final PaymentMethodResponseModel _self;
  final $Res Function(PaymentMethodResponseModel) _then;

/// Create a copy of PaymentMethodResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodResponseModel].
extension PaymentMethodResponseModelPatterns on PaymentMethodResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<PaymentMethodDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<PaymentMethodDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<PaymentMethodDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodResponseModel implements PaymentMethodResponseModel {
  const _PaymentMethodResponseModel({this.success, this.message, final  List<PaymentMethodDataModel>? data}): _data = data;
  factory _PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<PaymentMethodDataModel>? _data;
@override List<PaymentMethodDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PaymentMethodResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodResponseModelCopyWith<_PaymentMethodResponseModel> get copyWith => __$PaymentMethodResponseModelCopyWithImpl<_PaymentMethodResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PaymentMethodResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodResponseModelCopyWith<$Res> implements $PaymentMethodResponseModelCopyWith<$Res> {
  factory _$PaymentMethodResponseModelCopyWith(_PaymentMethodResponseModel value, $Res Function(_PaymentMethodResponseModel) _then) = __$PaymentMethodResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<PaymentMethodDataModel>? data
});




}
/// @nodoc
class __$PaymentMethodResponseModelCopyWithImpl<$Res>
    implements _$PaymentMethodResponseModelCopyWith<$Res> {
  __$PaymentMethodResponseModelCopyWithImpl(this._self, this._then);

  final _PaymentMethodResponseModel _self;
  final $Res Function(_PaymentMethodResponseModel) _then;

/// Create a copy of PaymentMethodResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_PaymentMethodResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDataModel>?,
  ));
}


}


/// @nodoc
mixin _$PaymentMethodDataModel {

 String? get id; String? get code; String? get name; String? get type; String? get provider; String? get image; bool? get isActive; DateTime? get createdAt; DateTime? get updatedAt; dynamic get deletedAt; String? get imageUrl;
/// Create a copy of PaymentMethodDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodDataModelCopyWith<PaymentMethodDataModel> get copyWith => _$PaymentMethodDataModelCopyWithImpl<PaymentMethodDataModel>(this as PaymentMethodDataModel, _$identity);

  /// Serializes this PaymentMethodDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,type,provider,image,isActive,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),imageUrl);

@override
String toString() {
  return 'PaymentMethodDataModel(id: $id, code: $code, name: $name, type: $type, provider: $provider, image: $image, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodDataModelCopyWith<$Res>  {
  factory $PaymentMethodDataModelCopyWith(PaymentMethodDataModel value, $Res Function(PaymentMethodDataModel) _then) = _$PaymentMethodDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? code, String? name, String? type, String? provider, String? image, bool? isActive, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt, String? imageUrl
});




}
/// @nodoc
class _$PaymentMethodDataModelCopyWithImpl<$Res>
    implements $PaymentMethodDataModelCopyWith<$Res> {
  _$PaymentMethodDataModelCopyWithImpl(this._self, this._then);

  final PaymentMethodDataModel _self;
  final $Res Function(PaymentMethodDataModel) _then;

/// Create a copy of PaymentMethodDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = freezed,Object? name = freezed,Object? type = freezed,Object? provider = freezed,Object? image = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodDataModel].
extension PaymentMethodDataModelPatterns on PaymentMethodDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodDataModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? code,  String? name,  String? type,  String? provider,  String? image,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodDataModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.type,_that.provider,_that.image,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? code,  String? name,  String? type,  String? provider,  String? image,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDataModel():
return $default(_that.id,_that.code,_that.name,_that.type,_that.provider,_that.image,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? code,  String? name,  String? type,  String? provider,  String? image,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDataModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.type,_that.provider,_that.image,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodDataModel implements PaymentMethodDataModel {
  const _PaymentMethodDataModel({this.id, this.code, this.name, this.type, this.provider, this.image, this.isActive, this.createdAt, this.updatedAt, this.deletedAt, this.imageUrl});
  factory _PaymentMethodDataModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodDataModelFromJson(json);

@override final  String? id;
@override final  String? code;
@override final  String? name;
@override final  String? type;
@override final  String? provider;
@override final  String? image;
@override final  bool? isActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  dynamic deletedAt;
@override final  String? imageUrl;

/// Create a copy of PaymentMethodDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodDataModelCopyWith<_PaymentMethodDataModel> get copyWith => __$PaymentMethodDataModelCopyWithImpl<_PaymentMethodDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,type,provider,image,isActive,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),imageUrl);

@override
String toString() {
  return 'PaymentMethodDataModel(id: $id, code: $code, name: $name, type: $type, provider: $provider, image: $image, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodDataModelCopyWith<$Res> implements $PaymentMethodDataModelCopyWith<$Res> {
  factory _$PaymentMethodDataModelCopyWith(_PaymentMethodDataModel value, $Res Function(_PaymentMethodDataModel) _then) = __$PaymentMethodDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? code, String? name, String? type, String? provider, String? image, bool? isActive, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt, String? imageUrl
});




}
/// @nodoc
class __$PaymentMethodDataModelCopyWithImpl<$Res>
    implements _$PaymentMethodDataModelCopyWith<$Res> {
  __$PaymentMethodDataModelCopyWithImpl(this._self, this._then);

  final _PaymentMethodDataModel _self;
  final $Res Function(_PaymentMethodDataModel) _then;

/// Create a copy of PaymentMethodDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = freezed,Object? name = freezed,Object? type = freezed,Object? provider = freezed,Object? image = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? imageUrl = freezed,}) {
  return _then(_PaymentMethodDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
