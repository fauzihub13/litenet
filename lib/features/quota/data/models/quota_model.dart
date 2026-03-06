import 'package:freezed_annotation/freezed_annotation.dart';

part 'quota_model.freezed.dart';
part 'quota_model.g.dart';

@freezed
abstract class QuotaResponseModel with _$QuotaResponseModel {
  const factory QuotaResponseModel({
    bool? success,
    String? message,
    List<QuotaDataModel>? data,
  }) = _QuotaResponseModel;

  factory QuotaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuotaResponseModelFromJson(json);
}

@freezed
abstract class QuotaDataModel with _$QuotaDataModel {
  const factory QuotaDataModel({
    String? id,
    String? code,
    String? slug,
    String? name,
    int? quota,
    int? monthDuration,
    String? description,
    int? basePrice,
    int? promoPrice,
    int? discount,
    String? capacity,
    bool? isPromo,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) = _QuotaDataModel;

  factory QuotaDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuotaDataModelFromJson(json);
}
