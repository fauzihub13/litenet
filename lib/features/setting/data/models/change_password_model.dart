import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model.freezed.dart';
part 'change_password_model.g.dart';

@freezed
abstract class ChangePasswordResponseModel with _$ChangePasswordResponseModel {
  const factory ChangePasswordResponseModel({bool? success, String? message}) =
      _ChangePassword;

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);
}
