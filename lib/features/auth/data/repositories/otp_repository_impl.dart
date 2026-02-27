import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/datasources/otp_datasource.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';
import 'package:litenet/features/auth/domain/repositories/otp_repository.dart';

class OTPRepositoryImpl extends OTPRepository {
  final OTPDatasource otpDatasource;

  OTPRepositoryImpl({required this.otpDatasource});

  @override
  Future<Either<Failure, OTPResponse>> resendOTP({
    required String email,
  }) async {
    try {
      final response = await otpDatasource.resendOTP(email: email);

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

  @override
  Future<Either<Failure, OTPResponse>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await otpDatasource.verifyOTP(email: email, otp: otp);

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
