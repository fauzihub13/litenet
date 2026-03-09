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
      totalQuota: totalQuota ?? '0 GB',
      totalUsage: totalUsage ?? '0%',
    );
  }
}
