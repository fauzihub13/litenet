import 'package:litenet/features/setting/data/models/change_password_model.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';

extension ChangePasswordResponseModelMapper on ChangePasswordResponseModel {
  ChangePasswordResponse toEntity() {
    return ChangePasswordResponse(
      success: success ?? false,
      message: message ?? '-',
    );
  }
}
