import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:litenet/core/errors/dio_error.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/data/datasources/promo_datasource.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/domain/repositories/promo_repository.dart';

class PromoRepositoryImpl extends PromoRepository {
  final PromoDatasource promoDatasource;

  PromoRepositoryImpl({required this.promoDatasource});

  @override
  Future<Either<Failure, PromoResponse>> getPromo() async {
    try {
      final response = await promoDatasource.getPromo();

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
