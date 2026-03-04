import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
abstract class FAQResponseModel with _$FAQResponseModel {
  const factory FAQResponseModel({
    bool? success,
    String? message,
    List<FAQDataModel>? data,
  }) = _FAQResponseModel;

  factory FAQResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FAQResponseModelFromJson(json);
}

@freezed
abstract class FAQDataModel with _$FAQDataModel {
  const factory FAQDataModel({
    String? id,
    String? slug,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) = _FAQDataModel;

  factory FAQDataModel.fromJson(Map<String, dynamic> json) =>
      _$FAQDataModelFromJson(json);
}
