import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';

abstract class QuotaRepository {
  Future<Either<Failure, QuotaResponse>> getAllQuotas();
  Future<Either<Failure, DetailQuotaResponse>> getDetailQuota({
    required String id,
  });
  Future<Either<Failure, CheckPromoResponse>> checkPromoCode({
    required String dataPlanId,
    required String promoCode
  });
}
