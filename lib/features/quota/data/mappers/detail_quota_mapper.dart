import 'package:litenet/features/quota/data/models/detail_quota_model.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';

extension DetailQuotaResponseModelMapper on DetailQuotaResponseModel {
  DetailQuotaResponse toEntity() {
    return DetailQuotaResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? DetailQuotaDataModel()).toEntity(),
    );
  }
}

extension DetailQuotaDataModelMapper on DetailQuotaDataModel {
  DetailQuotaDataEntity toEntity() {
    return DetailQuotaDataEntity(
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
      terms: terms ?? [],
      devices: devices?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension DeviceQuotaDataModelMapper on DeviceQuotaDataModel {
  DeviceQuotaDataEntity toEntity() {
    return DeviceQuotaDataEntity(id: id ?? '-', name: name ?? '-');
  }
}
