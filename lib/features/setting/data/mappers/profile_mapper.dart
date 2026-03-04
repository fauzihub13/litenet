import 'package:litenet/features/auth/data/mappers/login_mapper.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/setting/data/models/profile_model.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';

extension ProfileResponseModelMapper on ProfileResponseModel {
  ProfileResponse toEntity() {
    return ProfileResponse(
      success: success ?? false,
      message: message ?? '-',
      data: (data ?? UserModel()).toEntity(),
    );
  }
}
