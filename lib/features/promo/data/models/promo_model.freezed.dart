// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromoResponseModel {

 bool? get success; String? get message; List<PromoDataModel>? get data;
/// Create a copy of PromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoResponseModelCopyWith<PromoResponseModel> get copyWith => _$PromoResponseModelCopyWithImpl<PromoResponseModel>(this as PromoResponseModel, _$identity);

  /// Serializes this PromoResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PromoResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $PromoResponseModelCopyWith<$Res>  {
  factory $PromoResponseModelCopyWith(PromoResponseModel value, $Res Function(PromoResponseModel) _then) = _$PromoResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<PromoDataModel>? data
});




}
/// @nodoc
class _$PromoResponseModelCopyWithImpl<$Res>
    implements $PromoResponseModelCopyWith<$Res> {
  _$PromoResponseModelCopyWithImpl(this._self, this._then);

  final PromoResponseModel _self;
  final $Res Function(PromoResponseModel) _then;

/// Create a copy of PromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PromoDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoResponseModel].
extension PromoResponseModelPatterns on PromoResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PromoResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PromoResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<PromoDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<PromoDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _PromoResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<PromoDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _PromoResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoResponseModel implements PromoResponseModel {
  const _PromoResponseModel({this.success, this.message, final  List<PromoDataModel>? data}): _data = data;
  factory _PromoResponseModel.fromJson(Map<String, dynamic> json) => _$PromoResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<PromoDataModel>? _data;
@override List<PromoDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoResponseModelCopyWith<_PromoResponseModel> get copyWith => __$PromoResponseModelCopyWithImpl<_PromoResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PromoResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PromoResponseModelCopyWith<$Res> implements $PromoResponseModelCopyWith<$Res> {
  factory _$PromoResponseModelCopyWith(_PromoResponseModel value, $Res Function(_PromoResponseModel) _then) = __$PromoResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<PromoDataModel>? data
});




}
/// @nodoc
class __$PromoResponseModelCopyWithImpl<$Res>
    implements _$PromoResponseModelCopyWith<$Res> {
  __$PromoResponseModelCopyWithImpl(this._self, this._then);

  final _PromoResponseModel _self;
  final $Res Function(_PromoResponseModel) _then;

/// Create a copy of PromoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_PromoResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PromoDataModel>?,
  ));
}


}


/// @nodoc
mixin _$PromoDataModel {

 String? get id; String? get slug; String? get title; int? get minimumTransaction; int? get maxDiscount; String? get promoCode; DateTime? get startAt; DateTime? get endAt; bool? get isActive; DateTime? get createdAt; DateTime? get updatedAt; dynamic get deletedAt;
/// Create a copy of PromoDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoDataModelCopyWith<PromoDataModel> get copyWith => _$PromoDataModelCopyWithImpl<PromoDataModel>(this as PromoDataModel, _$identity);

  /// Serializes this PromoDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.minimumTransaction, minimumTransaction) || other.minimumTransaction == minimumTransaction)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,minimumTransaction,maxDiscount,promoCode,startAt,endAt,isActive,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'PromoDataModel(id: $id, slug: $slug, title: $title, minimumTransaction: $minimumTransaction, maxDiscount: $maxDiscount, promoCode: $promoCode, startAt: $startAt, endAt: $endAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $PromoDataModelCopyWith<$Res>  {
  factory $PromoDataModelCopyWith(PromoDataModel value, $Res Function(PromoDataModel) _then) = _$PromoDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? slug, String? title, int? minimumTransaction, int? maxDiscount, String? promoCode, DateTime? startAt, DateTime? endAt, bool? isActive, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class _$PromoDataModelCopyWithImpl<$Res>
    implements $PromoDataModelCopyWith<$Res> {
  _$PromoDataModelCopyWithImpl(this._self, this._then);

  final PromoDataModel _self;
  final $Res Function(PromoDataModel) _then;

/// Create a copy of PromoDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? minimumTransaction = freezed,Object? maxDiscount = freezed,Object? promoCode = freezed,Object? startAt = freezed,Object? endAt = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,minimumTransaction: freezed == minimumTransaction ? _self.minimumTransaction : minimumTransaction // ignore: cast_nullable_to_non_nullable
as int?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoDataModel].
extension PromoDataModelPatterns on PromoDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoDataModel value)  $default,){
final _that = this;
switch (_that) {
case _PromoDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _PromoDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? slug,  String? title,  int? minimumTransaction,  int? maxDiscount,  String? promoCode,  DateTime? startAt,  DateTime? endAt,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoDataModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.minimumTransaction,_that.maxDiscount,_that.promoCode,_that.startAt,_that.endAt,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? slug,  String? title,  int? minimumTransaction,  int? maxDiscount,  String? promoCode,  DateTime? startAt,  DateTime? endAt,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)  $default,) {final _that = this;
switch (_that) {
case _PromoDataModel():
return $default(_that.id,_that.slug,_that.title,_that.minimumTransaction,_that.maxDiscount,_that.promoCode,_that.startAt,_that.endAt,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? slug,  String? title,  int? minimumTransaction,  int? maxDiscount,  String? promoCode,  DateTime? startAt,  DateTime? endAt,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt,  dynamic deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _PromoDataModel() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.minimumTransaction,_that.maxDiscount,_that.promoCode,_that.startAt,_that.endAt,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoDataModel implements PromoDataModel {
  const _PromoDataModel({this.id, this.slug, this.title, this.minimumTransaction, this.maxDiscount, this.promoCode, this.startAt, this.endAt, this.isActive, this.createdAt, this.updatedAt, this.deletedAt});
  factory _PromoDataModel.fromJson(Map<String, dynamic> json) => _$PromoDataModelFromJson(json);

@override final  String? id;
@override final  String? slug;
@override final  String? title;
@override final  int? minimumTransaction;
@override final  int? maxDiscount;
@override final  String? promoCode;
@override final  DateTime? startAt;
@override final  DateTime? endAt;
@override final  bool? isActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  dynamic deletedAt;

/// Create a copy of PromoDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoDataModelCopyWith<_PromoDataModel> get copyWith => __$PromoDataModelCopyWithImpl<_PromoDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.minimumTransaction, minimumTransaction) || other.minimumTransaction == minimumTransaction)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,minimumTransaction,maxDiscount,promoCode,startAt,endAt,isActive,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'PromoDataModel(id: $id, slug: $slug, title: $title, minimumTransaction: $minimumTransaction, maxDiscount: $maxDiscount, promoCode: $promoCode, startAt: $startAt, endAt: $endAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$PromoDataModelCopyWith<$Res> implements $PromoDataModelCopyWith<$Res> {
  factory _$PromoDataModelCopyWith(_PromoDataModel value, $Res Function(_PromoDataModel) _then) = __$PromoDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? slug, String? title, int? minimumTransaction, int? maxDiscount, String? promoCode, DateTime? startAt, DateTime? endAt, bool? isActive, DateTime? createdAt, DateTime? updatedAt, dynamic deletedAt
});




}
/// @nodoc
class __$PromoDataModelCopyWithImpl<$Res>
    implements _$PromoDataModelCopyWith<$Res> {
  __$PromoDataModelCopyWithImpl(this._self, this._then);

  final _PromoDataModel _self;
  final $Res Function(_PromoDataModel) _then;

/// Create a copy of PromoDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? minimumTransaction = freezed,Object? maxDiscount = freezed,Object? promoCode = freezed,Object? startAt = freezed,Object? endAt = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_PromoDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,minimumTransaction: freezed == minimumTransaction ? _self.minimumTransaction : minimumTransaction // ignore: cast_nullable_to_non_nullable
as int?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
