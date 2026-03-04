import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/domain/repositories/promo_repository.dart';

class GetPromoUsecase {
  final PromoRepository promoRepository;

  const GetPromoUsecase(this.promoRepository);

  Future<Either<Failure, PromoResponse>> call() async {
    return await promoRepository.getPromo();
  }
}
