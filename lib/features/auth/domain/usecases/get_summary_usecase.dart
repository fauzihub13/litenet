import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';

class GetSummaryUsecase {
  final AuthRepository authRepository;

  const GetSummaryUsecase(this.authRepository);

  Future<Either<Failure, SummaryResponse>> call() async {
    return await authRepository.getSummary();
  }
}
