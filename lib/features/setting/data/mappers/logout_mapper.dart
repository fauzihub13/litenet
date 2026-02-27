import 'package:litenet/features/setting/data/models/logout_model.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';

extension LogoutResponseModelMapper on LogoutResponseModel {
  LogoutResponse toEntity() {
    return LogoutResponse(success: success ?? false, message: message ?? '-');
  }
}
