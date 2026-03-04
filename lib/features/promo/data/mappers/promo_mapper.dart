import 'package:litenet/features/promo/data/models/promo_model.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';

extension PromoResponseModelMapper on PromoResponseModel {
  PromoResponse toEntity() {
    return PromoResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension PromoModelMapper on PromoDataModel {
  PromoDataEntity toEntity() {
    return PromoDataEntity(
      id: id ?? '-',
      slug: slug ?? '-',
      title: title ?? '-',
      minimumTransaction: minimumTransaction ?? 0,
      maxDiscount: maxDiscount ?? 0,
      promoCode: promoCode ?? '-',
      startAt: startAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      endAt: endAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      isActive: isActive ?? false,
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
