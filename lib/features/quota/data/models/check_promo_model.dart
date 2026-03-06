import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:litenet/features/promo/data/models/promo_model.dart';

part 'check_promo_model.freezed.dart';
part 'check_promo_model.g.dart';

@freezed
abstract class CheckPromoResponseModel with _$CheckPromoResponseModel {
  const factory CheckPromoResponseModel({
    bool? success,
    String? message,
    PromoDataModel? data,
  }) = _CheckPromoResponseModel;

  factory CheckPromoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckPromoResponseModelFromJson(json);
}