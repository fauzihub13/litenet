import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
abstract class SummaryResponseModel with _$SummaryResponseModel {
  const factory SummaryResponseModel({
    bool? success,
    String? message,
    SummaryDataModel? data,
  }) = _SummaryResponseModel;

  factory SummaryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseModelFromJson(json);
}

@freezed
abstract class SummaryDataModel with _$SummaryDataModel {
  const factory SummaryDataModel({
    int? totalDevice,
    int? onlineDevice,
    int? offlineDevice,
    int? inactiveDevice,
  }) = _SummaryDataModel;

  factory SummaryDataModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryDataModelFromJson(json);
}
