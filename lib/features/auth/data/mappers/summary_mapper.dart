import 'package:litenet/features/auth/data/models/summary_model.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';

extension SummaryResponseModelMapper on SummaryResponseModel {
  SummaryResponse toEntity() {
    return SummaryResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? const SummaryDataModel()).toEntity(),
    );
  }
}

extension SummaryDataModelMapper on SummaryDataModel {
  SummaryDataEntity toEntity() {
    return SummaryDataEntity(
      totalDevice: totalDevice ?? 0,
      onlineDevice: onlineDevice ?? 0,
      offlineDevice: offlineDevice ?? 0,
      inactiveDevice: inactiveDevice ?? 0,
    );
  }
}
