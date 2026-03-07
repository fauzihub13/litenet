import 'package:litenet/features/quota/data/di/datasource_provider.dart';
import 'package:litenet/features/quota/data/repositories/quota_repository_impl.dart';
import 'package:litenet/features/quota/data/repositories/transaction_repository_impl.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';
import 'package:litenet/features/quota/domain/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
QuotaRepository quotaRepository(Ref ref) {
  return QuotaRepositoryImpl(
    quotaDatasource: ref.read(quotaDatasourceProvider),
  );
}

@Riverpod(keepAlive: true)
TransactionRepository transactionRepository(Ref ref) {
  return TransactionRepositoryImpl(
    transactionDatasource: ref.read(transactionDatasourceProvider),
  );
}
