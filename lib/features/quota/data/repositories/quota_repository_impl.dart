import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/data/datasources/quota_datasource.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';

class QuotaRepositoryImpl extends QuotaRepository {
  final QuotaDatasource quotaDatasource;

  QuotaRepositoryImpl({required this.quotaDatasource});
  @override
  Future<Either<Failure, QuotaResponse>> getAllQuotas() async {
    try {
      final response = await quotaDatasource.getAllQuotas();

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
  Future<Either<Failure, DetailQuotaResponse>> getDetailQuota({
    required String id,
  }) async {
    try {
      final response = await quotaDatasource.getDetailQuota(id: id);

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
  Future<Either<Failure, CheckPromoResponse>> checkPromoCode({required String dataPlanId, required String promoCode}) async {
   try {
      final response = await quotaDatasource.checkPromoCode(dataPlanId: dataPlanId, promoCode: promoCode);

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
