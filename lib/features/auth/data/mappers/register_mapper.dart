import 'package:litenet/features/auth/data/models/register_model.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';

extension RegisterResponseModelMapper on RegisterResponseModel {
  RegisterResponse toEntity() {
    return RegisterResponse(success: success ?? false, message: message ?? '-');
  }
}
