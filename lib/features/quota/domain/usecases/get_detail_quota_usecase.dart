import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';

class GetDetailQuotaUsecase {
  final QuotaRepository quotaRepository;

  const GetDetailQuotaUsecase(this.quotaRepository);

  Future<Either<Failure, DetailQuotaResponse>> call({
    required String id,
  }) async {
    return await quotaRepository.getDetailQuota(id: id);
  }
}
