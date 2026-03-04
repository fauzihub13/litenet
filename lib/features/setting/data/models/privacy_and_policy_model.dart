import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_and_policy_model.freezed.dart';
part 'privacy_and_policy_model.g.dart';

@freezed
abstract class PrivacyAndPolicyResponseModel
    with _$PrivacyAndPolicyResponseModel {
  const factory PrivacyAndPolicyResponseModel({
    bool? success,
    String? message,
    List<PrivacyAndPolicyDataModel>? data,
  }) = _PrivacyAndPolicyResponseModel;

  factory PrivacyAndPolicyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyAndPolicyResponseModelFromJson(json);
}

@freezed
abstract class PrivacyAndPolicyDataModel with _$PrivacyAndPolicyDataModel {
  const factory PrivacyAndPolicyDataModel({
    String? id,
    String? slug,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) = _PrivacyAndPolicyDataModel;

  factory PrivacyAndPolicyDataModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyAndPolicyDataModelFromJson(json);
}
