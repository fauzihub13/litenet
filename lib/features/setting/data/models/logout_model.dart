import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_model.freezed.dart';
part 'logout_model.g.dart';

@freezed
abstract class LogoutResponseModel with _$LogoutResponseModel {
  const factory LogoutResponseModel({bool? success, String? message}) =
      _Logout;

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);
}
