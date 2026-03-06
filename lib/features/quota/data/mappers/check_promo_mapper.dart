import 'package:litenet/features/promo/data/mappers/promo_mapper.dart';
import 'package:litenet/features/promo/data/models/promo_model.dart';
import 'package:litenet/features/quota/data/models/check_promo_model.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';

extension CheckPromoResponseModelMapper on CheckPromoResponseModel {
  CheckPromoResponse toEntity() {
    return CheckPromoResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? PromoDataModel()).toEntity(),
    );
  }
}
