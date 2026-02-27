import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/data/datasources/setting_datasource.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class SettingRepositoryImpl extends SettingRepository {
  final SettingDatasource settingDatasource;

  SettingRepositoryImpl({required this.settingDatasource});

  @override
  Future<Either<Failure, LogoutResponse>> logout() async {
    try {
      final response = await settingDatasource.logout();

      if (!response.success) {
        return Left(Failure(message: response.message));
      }

      return Right(response);
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
