import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_quota_model.freezed.dart';
part 'detail_quota_model.g.dart';

@freezed
abstract class DetailQuotaResponseModel with _$DetailQuotaResponseModel {
  const factory DetailQuotaResponseModel({
    bool? success,
    String? message,
    DetailQuotaDataModel? data,
  }) = _DetailQuotaResponseModel;

  factory DetailQuotaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailQuotaResponseModelFromJson(json);
}

@freezed
abstract class DetailQuotaDataModel with _$DetailQuotaDataModel {
  const factory DetailQuotaDataModel({
    String? id,
    String? code,
    String? slug,
    String? name,
    int? quota,
    int? monthDuration,
    int? basePrice,
    int? promoPrice,
    int? discount,
    String? capacity,
    bool? isPromo,
    String? description,
    List<String>? terms,
    List<DeviceQuotaDataModel>? devices,
  }) = _DetailQuotaDataModel;

  factory DetailQuotaDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailQuotaDataModelFromJson(json);
}

@freezed
abstract class DeviceQuotaDataModel with _$DeviceQuotaDataModel {
  const factory DeviceQuotaDataModel({String? id, String? name}) =
      _DeviceQuotaDataModel;

  factory DeviceQuotaDataModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceQuotaDataModelFromJson(json);
}
