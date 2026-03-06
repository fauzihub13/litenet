import 'package:litenet/features/quota/data/models/quota_model.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';

extension QuotaResponseModelMapper on QuotaResponseModel {
  QuotaResponse toEntity() {
    return QuotaResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension QuotaDataModelMapper on QuotaDataModel {
  QuotaDataEntity toEntity() {
    return QuotaDataEntity(
      id: id ?? '-',
      code: code ?? '-',
      slug: slug ?? '-',
      name: name ?? '-',
      quota: quota ?? 0,
      monthDuration: monthDuration ?? 0,
      description: description ?? '-',
      basePrice: basePrice ?? 0,
      promoPrice: promoPrice ?? 0,
      discount: discount ?? 0,
      capacity: capacity ?? '-',
      isPromo: isPromo ?? false,
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? '-',
    );
  }
}
