import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileResponseModel with _$ProfileResponseModel {
  const factory ProfileResponseModel({
    bool? success,
    String? message,
    UserModel? data,
  }) = _Profile;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
