import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';

class CheckPromoUsecase {
  final QuotaRepository quotaRepository;

  const CheckPromoUsecase(this.quotaRepository);

  Future<Either<Failure, CheckPromoResponse>> call({
    required String dataPlanId,
    required String promoCode,
  }) async {
    return await quotaRepository.checkPromoCode(
      dataPlanId: dataPlanId,
      promoCode: promoCode,
    );
  }
}
