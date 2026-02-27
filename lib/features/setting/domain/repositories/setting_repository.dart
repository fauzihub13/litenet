import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';

abstract class SettingRepository {
  Future<Either<Failure, LogoutResponse>> logout();
}
