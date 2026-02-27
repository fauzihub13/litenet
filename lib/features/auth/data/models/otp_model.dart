import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';

part 'otp_model.freezed.dart';
part 'otp_model.g.dart';

@freezed
abstract class OTPResponseModel with _$OTPResponseModel {
  const factory OTPResponseModel({
    bool? success,
    String? message,
    OTPDataModel? data,
  }) = _OTP;

  factory OTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseModelFromJson(json);
}

@freezed
abstract class OTPDataModel with _$OTPDataModel {
  const factory OTPDataModel({
    UserModel? user,
    bool? isVerified,
    String? token,
  }) = _OTPDataModel;

  factory OTPDataModel.fromJson(Map<String, dynamic> json) =>
      _$OTPDataModelFromJson(json);
}
