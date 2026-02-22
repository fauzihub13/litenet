import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/datasources/login_datasource.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl({required this.loginDatasource});

  @override
  Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await loginDatasource.login(
        email: email,
        password: password,
      );

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
