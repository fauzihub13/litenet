import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';

abstract class PromoRepository {
  Future<Either<Failure, PromoResponse>> getPromo();
}
