import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/datasources/register_datasource.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:litenet/features/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDatasource registerDatasource;

  RegisterRepositoryImpl({required this.registerDatasource});

  @override
  Future<Either<Failure, RegisterResponse>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
  }) async {
    try {
      final response = await registerDatasource.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        phoneNumber: phoneNumber,
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
