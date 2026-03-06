// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuotaResponseModel {

 bool? get success; String? get message; List<QuotaDataModel>? get data;
/// Create a copy of QuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotaResponseModelCopyWith<QuotaResponseModel> get copyWith => _$QuotaResponseModelCopyWithImpl<QuotaResponseModel>(this as QuotaResponseModel, _$identity);

  /// Serializes this QuotaResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotaResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'QuotaResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $QuotaResponseModelCopyWith<$Res>  {
  factory $QuotaResponseModelCopyWith(QuotaResponseModel value, $Res Function(QuotaResponseModel) _then) = _$QuotaResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<QuotaDataModel>? data
});




}
/// @nodoc
class _$QuotaResponseModelCopyWithImpl<$Res>
    implements $QuotaResponseModelCopyWith<$Res> {
  _$QuotaResponseModelCopyWithImpl(this._self, this._then);

  final QuotaResponseModel _self;
  final $Res Function(QuotaResponseModel) _then;

/// Create a copy of QuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<QuotaDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuotaResponseModel].
extension QuotaResponseModelPatterns on QuotaResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuotaResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuotaResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuotaResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _QuotaResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuotaResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuotaResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<QuotaDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotaResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<QuotaDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _QuotaResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<QuotaDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _QuotaResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuotaResponseModel implements QuotaResponseModel {
  const _QuotaResponseModel({this.success, this.message, final  List<QuotaDataModel>? data}): _data = data;
  factory _QuotaResponseModel.fromJson(Map<String, dynamic> json) => _$QuotaResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<QuotaDataModel>? _data;
@override List<QuotaDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuotaResponseModelCopyWith<_QuotaResponseModel> get copyWith => __$QuotaResponseModelCopyWithImpl<_QuotaResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuotaResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotaResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'QuotaResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$QuotaResponseModelCopyWith<$Res> implements $QuotaResponseModelCopyWith<$Res> {
  factory _$QuotaResponseModelCopyWith(_QuotaResponseModel value, $Res Function(_QuotaResponseModel) _then) = __$QuotaResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<QuotaDataModel>? data
});




}
/// @nodoc
class __$QuotaResponseModelCopyWithImpl<$Res>
    implements _$QuotaResponseModelCopyWith<$Res> {
  __$QuotaResponseModelCopyWithImpl(this._self, this._then);

  final _QuotaResponseModel _self;
  final $Res Function(_QuotaResponseModel) _then;

/// Create a copy of QuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_QuotaResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<QuotaDataModel>?,
  ));
}


}


/// @nodoc
mixin _$QuotaDataModel {

 String? get id; String? get code; String? get slug; String? get name; int? get quota; int? get monthDuration; String? get description; int? get basePrice; int? get promoPrice; int? get discount; String? get capacity; bool? get isPromo; DateTime? get createdAt; DateTime? get updatedAt; dynamic get deletedAt;
/// Create a copy of QuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotaDataModelCopyWith<QuotaDataModel> get copyWith => _$QuotaDataModelCopyWithImpl<QuotaDataModel>(this as QuotaDataModel, _$identity);

  /// Serializes this QuotaDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotaDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.monthDuration, monthDuration) || other.monthDuration == monthDuration)&&(identical(other.description, description) || other.description == description)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.promoPrice, promoPrice) || other.promoPrice == promoPrice)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.isPromo, isPromo) || other.isPromo == isPromo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,slug,name,quota,monthDuration,description,basePrice,promoPrice,discount,capacity,isPromo,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'QuotaDataModel(id: $id, code: $code, slug: $slug, name: $name, quota: $quota, monthDuration: $monthDuration, description: $description, basePrice: $basePrice, promoPrice: $promoPrice, discount: $discount, capacity: $capacity, isPromo: $isPromo, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $QuotaDataModelCopyWith<$Res>  {
  factory $QuotaDataModelCopyWith(QuotaDataModel value, $Res Function(QuotaDataModel) _then) = _$QuotaDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? code, String? slug, String? name, int? quota, int? monthDuration, String? description, int? basePrice, int? promoPrice, int? discount, String? capacity, bool? isPromo, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class _$QuotaDataModelCopyWithImpl<$Res>
    implements $QuotaDataModelCopyWith<$Res> {
  _$QuotaDataModelCopyWithImpl(this._self, this._then);

  final QuotaDataModel _self;
  final $Res Function(QuotaDataModel) _then;

/// Create a copy of QuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = freezed,Object? slug = freezed,Object? name = freezed,Object? quota = freezed,Object? monthDuration = freezed,Object? description = freezed,Object? basePrice = freezed,Object? promoPrice = freezed,Object? discount = freezed,Object? capacity = freezed,Object? isPromo = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int?,monthDuration: freezed == monthDuration ? _self.monthDuration : monthDuration // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int?,promoPrice: freezed == promoPrice ? _self.promoPrice : promoPrice // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,isPromo: freezed == isPromo ? _self.isPromo : isPromo // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [QuotaDataModel].
extension QuotaDataModelPatterns on QuotaDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuotaDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuotaDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuotaDataModel value)  $default,){
final _that = this;
switch (_that) {
case _QuotaDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuotaDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuotaDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? code,  String? slug,  String? name,  int? quota,  int? monthDuration,  String? description,  int? basePrice,  int? promoPrice,  int? discount,  String? capacity,  bool? isPromo,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotaDataModel() when $default != null:
return $default(_that.id,_that.code,_that.slug,_that.name,_that.quota,_that.monthDuration,_that.description,_that.basePrice,_that.promoPrice,_that.discount,_that.capacity,_that.isPromo,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? code,  String? slug,  String? name,  int? quota,  int? monthDuration,  String? description,  int? basePrice,  int? promoPrice,  int? discount,  String? capacity,  bool? isPromo,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)  $default,) {final _that = this;
switch (_that) {
case _QuotaDataModel():
return $default(_that.id,_that.code,_that.slug,_that.name,_that.quota,_that.monthDuration,_that.description,_that.basePrice,_that.promoPrice,_that.discount,_that.capacity,_that.isPromo,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? code,  String? slug,  String? name,  int? quota,  int? monthDuration,  String? description,  int? basePrice,  int? promoPrice,  int? discount,  String? capacity,  bool? isPromo,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _QuotaDataModel() when $default != null:
return $default(_that.id,_that.code,_that.slug,_that.name,_that.quota,_that.monthDuration,_that.description,_that.basePrice,_that.promoPrice,_that.discount,_that.capacity,_that.isPromo,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuotaDataModel implements QuotaDataModel {
  const _QuotaDataModel({this.id, this.code, this.slug, this.name, this.quota, this.monthDuration, this.description, this.basePrice, this.promoPrice, this.discount, this.capacity, this.isPromo, this.createdAt, this.updatedAt, this.deletedAt});
  factory _QuotaDataModel.fromJson(Map<String, dynamic> json) => _$QuotaDataModelFromJson(json);

@override final  String? id;
@override final  String? code;
@override final  String? slug;
@override final  String? name;
@override final  int? quota;
@override final  int? monthDuration;
@override final  String? description;
@override final  int? basePrice;
@override final  int? promoPrice;
@override final  int? discount;
@override final  String? capacity;
@override final  bool? isPromo;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  dynamic deletedAt;

/// Create a copy of QuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuotaDataModelCopyWith<_QuotaDataModel> get copyWith => __$QuotaDataModelCopyWithImpl<_QuotaDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuotaDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotaDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.monthDuration, monthDuration) || other.monthDuration == monthDuration)&&(identical(other.description, description) || other.description == description)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.promoPrice, promoPrice) || other.promoPrice == promoPrice)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.isPromo, isPromo) || other.isPromo == isPromo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,slug,name,quota,monthDuration,description,basePrice,promoPrice,discount,capacity,isPromo,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'QuotaDataModel(id: $id, code: $code, slug: $slug, name: $name, quota: $quota, monthDuration: $monthDuration, description: $description, basePrice: $basePrice, promoPrice: $promoPrice, discount: $discount, capacity: $capacity, isPromo: $isPromo, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$QuotaDataModelCopyWith<$Res> implements $QuotaDataModelCopyWith<$Res> {
  factory _$QuotaDataModelCopyWith(_QuotaDataModel value, $Res Function(_QuotaDataModel) _then) = __$QuotaDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? code, String? slug, String? name, int? quota, int? monthDuration, String? description, int? basePrice, int? promoPrice, int? discount, String? capacity, bool? isPromo, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class __$QuotaDataModelCopyWithImpl<$Res>
    implements _$QuotaDataModelCopyWith<$Res> {
  __$QuotaDataModelCopyWithImpl(this._self, this._then);

  final _QuotaDataModel _self;
  final $Res Function(_QuotaDataModel) _then;

/// Create a copy of QuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = freezed,Object? slug = freezed,Object? name = freezed,Object? quota = freezed,Object? monthDuration = freezed,Object? description = freezed,Object? basePrice = freezed,Object? promoPrice = freezed,Object? discount = freezed,Object? capacity = freezed,Object? isPromo = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_QuotaDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int?,monthDuration: freezed == monthDuration ? _self.monthDuration : monthDuration // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int?,promoPrice: freezed == promoPrice ? _self.promoPrice : promoPrice // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,isPromo: freezed == isPromo ? _self.isPromo : isPromo // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
