import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';

class GetAllQuotaUsecase {
  final QuotaRepository quotaRepository;

  const GetAllQuotaUsecase(this.quotaRepository);

  Future<Either<Failure, QuotaResponse>> call() async {
    return await quotaRepository.getAllQuotas();
  }
}
