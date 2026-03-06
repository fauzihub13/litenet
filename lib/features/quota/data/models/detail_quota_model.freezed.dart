// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailQuotaResponseModel {

 bool? get success; String? get message; DetailQuotaDataModel? get data;
/// Create a copy of DetailQuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailQuotaResponseModelCopyWith<DetailQuotaResponseModel> get copyWith => _$DetailQuotaResponseModelCopyWithImpl<DetailQuotaResponseModel>(this as DetailQuotaResponseModel, _$identity);

  /// Serializes this DetailQuotaResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailQuotaResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DetailQuotaResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DetailQuotaResponseModelCopyWith<$Res>  {
  factory $DetailQuotaResponseModelCopyWith(DetailQuotaResponseModel value, $Res Function(DetailQuotaResponseModel) _then) = _$DetailQuotaResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, DetailQuotaDataModel? data
});


$DetailQuotaDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$DetailQuotaResponseModelCopyWithImpl<$Res>
    implements $DetailQuotaResponseModelCopyWith<$Res> {
  _$DetailQuotaResponseModelCopyWithImpl(this._self, this._then);

  final DetailQuotaResponseModel _self;
  final $Res Function(DetailQuotaResponseModel) _then;

/// Create a copy of DetailQuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DetailQuotaDataModel?,
  ));
}
/// Create a copy of DetailQuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailQuotaDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DetailQuotaDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailQuotaResponseModel].
extension DetailQuotaResponseModelPatterns on DetailQuotaResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailQuotaResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailQuotaResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailQuotaResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailQuotaResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailQuotaResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailQuotaResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  DetailQuotaDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailQuotaResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  DetailQuotaDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _DetailQuotaResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  DetailQuotaDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _DetailQuotaResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailQuotaResponseModel implements DetailQuotaResponseModel {
  const _DetailQuotaResponseModel({this.success, this.message, this.data});
  factory _DetailQuotaResponseModel.fromJson(Map<String, dynamic> json) => _$DetailQuotaResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  DetailQuotaDataModel? data;

/// Create a copy of DetailQuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailQuotaResponseModelCopyWith<_DetailQuotaResponseModel> get copyWith => __$DetailQuotaResponseModelCopyWithImpl<_DetailQuotaResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailQuotaResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailQuotaResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DetailQuotaResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DetailQuotaResponseModelCopyWith<$Res> implements $DetailQuotaResponseModelCopyWith<$Res> {
  factory _$DetailQuotaResponseModelCopyWith(_DetailQuotaResponseModel value, $Res Function(_DetailQuotaResponseModel) _then) = __$DetailQuotaResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, DetailQuotaDataModel? data
});


@override $DetailQuotaDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$DetailQuotaResponseModelCopyWithImpl<$Res>
    implements _$DetailQuotaResponseModelCopyWith<$Res> {
  __$DetailQuotaResponseModelCopyWithImpl(this._self, this._then);

  final _DetailQuotaResponseModel _self;
  final $Res Function(_DetailQuotaResponseModel) _then;

/// Create a copy of DetailQuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_DetailQuotaResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DetailQuotaDataModel?,
  ));
}

/// Create a copy of DetailQuotaResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailQuotaDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DetailQuotaDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DetailQuotaDataModel {

 String? get id; String? get code; String? get slug; String? get name; int? get quota; int? get monthDuration; int? get basePrice; int? get promoPrice; int? get discount; String? get capacity; bool? get isPromo; String? get description; List<String>? get terms; List<DeviceQuotaDataModel>? get devices;
/// Create a copy of DetailQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailQuotaDataModelCopyWith<DetailQuotaDataModel> get copyWith => _$DetailQuotaDataModelCopyWithImpl<DetailQuotaDataModel>(this as DetailQuotaDataModel, _$identity);

  /// Serializes this DetailQuotaDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailQuotaDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.monthDuration, monthDuration) || other.monthDuration == monthDuration)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.promoPrice, promoPrice) || other.promoPrice == promoPrice)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.isPromo, isPromo) || other.isPromo == isPromo)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.terms, terms)&&const DeepCollectionEquality().equals(other.devices, devices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,slug,name,quota,monthDuration,basePrice,promoPrice,discount,capacity,isPromo,description,const DeepCollectionEquality().hash(terms),const DeepCollectionEquality().hash(devices));

@override
String toString() {
  return 'DetailQuotaDataModel(id: $id, code: $code, slug: $slug, name: $name, quota: $quota, monthDuration: $monthDuration, basePrice: $basePrice, promoPrice: $promoPrice, discount: $discount, capacity: $capacity, isPromo: $isPromo, description: $description, terms: $terms, devices: $devices)';
}


}

/// @nodoc
abstract mixin class $DetailQuotaDataModelCopyWith<$Res>  {
  factory $DetailQuotaDataModelCopyWith(DetailQuotaDataModel value, $Res Function(DetailQuotaDataModel) _then) = _$DetailQuotaDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? code, String? slug, String? name, int? quota, int? monthDuration, int? basePrice, int? promoPrice, int? discount, String? capacity, bool? isPromo, String? description, List<String>? terms, List<DeviceQuotaDataModel>? devices
});




}
/// @nodoc
class _$DetailQuotaDataModelCopyWithImpl<$Res>
    implements $DetailQuotaDataModelCopyWith<$Res> {
  _$DetailQuotaDataModelCopyWithImpl(this._self, this._then);

  final DetailQuotaDataModel _self;
  final $Res Function(DetailQuotaDataModel) _then;

/// Create a copy of DetailQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = freezed,Object? slug = freezed,Object? name = freezed,Object? quota = freezed,Object? monthDuration = freezed,Object? basePrice = freezed,Object? promoPrice = freezed,Object? discount = freezed,Object? capacity = freezed,Object? isPromo = freezed,Object? description = freezed,Object? terms = freezed,Object? devices = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int?,monthDuration: freezed == monthDuration ? _self.monthDuration : monthDuration // ignore: cast_nullable_to_non_nullable
as int?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int?,promoPrice: freezed == promoPrice ? _self.promoPrice : promoPrice // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,isPromo: freezed == isPromo ? _self.isPromo : isPromo // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as List<String>?,devices: freezed == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceQuotaDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailQuotaDataModel].
extension DetailQuotaDataModelPatterns on DetailQuotaDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailQuotaDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailQuotaDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailQuotaDataModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailQuotaDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailQuotaDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailQuotaDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? code,  String? slug,  String? name,  int? quota,  int? monthDuration,  int? basePrice,  int? promoPrice,  int? discount,  String? capacity,  bool? isPromo,  String? description,  List<String>? terms,  List<DeviceQuotaDataModel>? devices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailQuotaDataModel() when $default != null:
return $default(_that.id,_that.code,_that.slug,_that.name,_that.quota,_that.monthDuration,_that.basePrice,_that.promoPrice,_that.discount,_that.capacity,_that.isPromo,_that.description,_that.terms,_that.devices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? code,  String? slug,  String? name,  int? quota,  int? monthDuration,  int? basePrice,  int? promoPrice,  int? discount,  String? capacity,  bool? isPromo,  String? description,  List<String>? terms,  List<DeviceQuotaDataModel>? devices)  $default,) {final _that = this;
switch (_that) {
case _DetailQuotaDataModel():
return $default(_that.id,_that.code,_that.slug,_that.name,_that.quota,_that.monthDuration,_that.basePrice,_that.promoPrice,_that.discount,_that.capacity,_that.isPromo,_that.description,_that.terms,_that.devices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? code,  String? slug,  String? name,  int? quota,  int? monthDuration,  int? basePrice,  int? promoPrice,  int? discount,  String? capacity,  bool? isPromo,  String? description,  List<String>? terms,  List<DeviceQuotaDataModel>? devices)?  $default,) {final _that = this;
switch (_that) {
case _DetailQuotaDataModel() when $default != null:
return $default(_that.id,_that.code,_that.slug,_that.name,_that.quota,_that.monthDuration,_that.basePrice,_that.promoPrice,_that.discount,_that.capacity,_that.isPromo,_that.description,_that.terms,_that.devices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailQuotaDataModel implements DetailQuotaDataModel {
  const _DetailQuotaDataModel({this.id, this.code, this.slug, this.name, this.quota, this.monthDuration, this.basePrice, this.promoPrice, this.discount, this.capacity, this.isPromo, this.description, final  List<String>? terms, final  List<DeviceQuotaDataModel>? devices}): _terms = terms,_devices = devices;
  factory _DetailQuotaDataModel.fromJson(Map<String, dynamic> json) => _$DetailQuotaDataModelFromJson(json);

@override final  String? id;
@override final  String? code;
@override final  String? slug;
@override final  String? name;
@override final  int? quota;
@override final  int? monthDuration;
@override final  int? basePrice;
@override final  int? promoPrice;
@override final  int? discount;
@override final  String? capacity;
@override final  bool? isPromo;
@override final  String? description;
 final  List<String>? _terms;
@override List<String>? get terms {
  final value = _terms;
  if (value == null) return null;
  if (_terms is EqualUnmodifiableListView) return _terms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DeviceQuotaDataModel>? _devices;
@override List<DeviceQuotaDataModel>? get devices {
  final value = _devices;
  if (value == null) return null;
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DetailQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailQuotaDataModelCopyWith<_DetailQuotaDataModel> get copyWith => __$DetailQuotaDataModelCopyWithImpl<_DetailQuotaDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailQuotaDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailQuotaDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.monthDuration, monthDuration) || other.monthDuration == monthDuration)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.promoPrice, promoPrice) || other.promoPrice == promoPrice)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.isPromo, isPromo) || other.isPromo == isPromo)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._terms, _terms)&&const DeepCollectionEquality().equals(other._devices, _devices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,slug,name,quota,monthDuration,basePrice,promoPrice,discount,capacity,isPromo,description,const DeepCollectionEquality().hash(_terms),const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'DetailQuotaDataModel(id: $id, code: $code, slug: $slug, name: $name, quota: $quota, monthDuration: $monthDuration, basePrice: $basePrice, promoPrice: $promoPrice, discount: $discount, capacity: $capacity, isPromo: $isPromo, description: $description, terms: $terms, devices: $devices)';
}


}

/// @nodoc
abstract mixin class _$DetailQuotaDataModelCopyWith<$Res> implements $DetailQuotaDataModelCopyWith<$Res> {
  factory _$DetailQuotaDataModelCopyWith(_DetailQuotaDataModel value, $Res Function(_DetailQuotaDataModel) _then) = __$DetailQuotaDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? code, String? slug, String? name, int? quota, int? monthDuration, int? basePrice, int? promoPrice, int? discount, String? capacity, bool? isPromo, String? description, List<String>? terms, List<DeviceQuotaDataModel>? devices
});




}
/// @nodoc
class __$DetailQuotaDataModelCopyWithImpl<$Res>
    implements _$DetailQuotaDataModelCopyWith<$Res> {
  __$DetailQuotaDataModelCopyWithImpl(this._self, this._then);

  final _DetailQuotaDataModel _self;
  final $Res Function(_DetailQuotaDataModel) _then;

/// Create a copy of DetailQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = freezed,Object? slug = freezed,Object? name = freezed,Object? quota = freezed,Object? monthDuration = freezed,Object? basePrice = freezed,Object? promoPrice = freezed,Object? discount = freezed,Object? capacity = freezed,Object? isPromo = freezed,Object? description = freezed,Object? terms = freezed,Object? devices = freezed,}) {
  return _then(_DetailQuotaDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int?,monthDuration: freezed == monthDuration ? _self.monthDuration : monthDuration // ignore: cast_nullable_to_non_nullable
as int?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int?,promoPrice: freezed == promoPrice ? _self.promoPrice : promoPrice // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as String?,isPromo: freezed == isPromo ? _self.isPromo : isPromo // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self._terms : terms // ignore: cast_nullable_to_non_nullable
as List<String>?,devices: freezed == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceQuotaDataModel>?,
  ));
}


}


/// @nodoc
mixin _$DeviceQuotaDataModel {

 String? get id; String? get name;
/// Create a copy of DeviceQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceQuotaDataModelCopyWith<DeviceQuotaDataModel> get copyWith => _$DeviceQuotaDataModelCopyWithImpl<DeviceQuotaDataModel>(this as DeviceQuotaDataModel, _$identity);

  /// Serializes this DeviceQuotaDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceQuotaDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DeviceQuotaDataModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $DeviceQuotaDataModelCopyWith<$Res>  {
  factory $DeviceQuotaDataModelCopyWith(DeviceQuotaDataModel value, $Res Function(DeviceQuotaDataModel) _then) = _$DeviceQuotaDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$DeviceQuotaDataModelCopyWithImpl<$Res>
    implements $DeviceQuotaDataModelCopyWith<$Res> {
  _$DeviceQuotaDataModelCopyWithImpl(this._self, this._then);

  final DeviceQuotaDataModel _self;
  final $Res Function(DeviceQuotaDataModel) _then;

/// Create a copy of DeviceQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceQuotaDataModel].
extension DeviceQuotaDataModelPatterns on DeviceQuotaDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceQuotaDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceQuotaDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceQuotaDataModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceQuotaDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceQuotaDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceQuotaDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceQuotaDataModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _DeviceQuotaDataModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _DeviceQuotaDataModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceQuotaDataModel implements DeviceQuotaDataModel {
  const _DeviceQuotaDataModel({this.id, this.name});
  factory _DeviceQuotaDataModel.fromJson(Map<String, dynamic> json) => _$DeviceQuotaDataModelFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of DeviceQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceQuotaDataModelCopyWith<_DeviceQuotaDataModel> get copyWith => __$DeviceQuotaDataModelCopyWithImpl<_DeviceQuotaDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceQuotaDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceQuotaDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DeviceQuotaDataModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DeviceQuotaDataModelCopyWith<$Res> implements $DeviceQuotaDataModelCopyWith<$Res> {
  factory _$DeviceQuotaDataModelCopyWith(_DeviceQuotaDataModel value, $Res Function(_DeviceQuotaDataModel) _then) = __$DeviceQuotaDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$DeviceQuotaDataModelCopyWithImpl<$Res>
    implements _$DeviceQuotaDataModelCopyWith<$Res> {
  __$DeviceQuotaDataModelCopyWithImpl(this._self, this._then);

  final _DeviceQuotaDataModel _self;
  final $Res Function(_DeviceQuotaDataModel) _then;

/// Create a copy of DeviceQuotaDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_DeviceQuotaDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
