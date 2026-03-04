import 'package:litenet/features/setting/data/models/privacy_and_policy_model.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';

extension PrivacyAndPolicyResponseModelMapper on PrivacyAndPolicyResponseModel {
  PrivacyAndPolicyResponse toEntity() {
    return PrivacyAndPolicyResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension PrivacyAndPolicyModelMapper on PrivacyAndPolicyDataModel {
  PrivacyAndPolicyDataEntity toEntity() {
    return PrivacyAndPolicyDataEntity(
      id: id ?? '-',
      slug: slug ?? '-',
      title: title ?? '-',
      description: description ?? '-',
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? '-',
    );
  }
}
