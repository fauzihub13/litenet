import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_model.freezed.dart';
part 'promo_model.g.dart';

@freezed
abstract class PromoResponseModel
    with _$PromoResponseModel {
  const factory PromoResponseModel({
    bool? success,
    String? message,
    List<PromoDataModel>? data,
  }) = _PromoResponseModel;

  factory PromoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PromoResponseModelFromJson(json);
}

@freezed
abstract class PromoDataModel with _$PromoDataModel {
  const factory PromoDataModel({
   String? id,
    String? slug,
    String? title,
    int? minimumTransaction,
    int? maxDiscount,
    String? promoCode,
    DateTime? startAt,
    DateTime? endAt,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) = _PromoDataModel;

  factory PromoDataModel.fromJson(Map<String, dynamic> json) =>
      _$PromoDataModelFromJson(json);
}
