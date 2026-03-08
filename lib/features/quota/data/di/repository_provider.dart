import 'package:litenet/features/quota/data/di/datasource_provider.dart';
import 'package:litenet/features/quota/data/repositories/quota_repository_impl.dart';
import 'package:litenet/features/order/data/repositories/transaction_repository_impl.dart';
import 'package:litenet/features/quota/domain/repositories/quota_repository.dart';
import 'package:litenet/features/order/domain/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
QuotaRepository quotaRepository(Ref ref) {
  return QuotaRepositoryImpl(
    quotaDatasource: ref.read(quotaDatasourceProvider),
  );
}

@riverpod
TransactionRepository transactionRepository(Ref ref) {
  return TransactionRepositoryImpl(
    transactionDatasource: ref.read(transactionDatasourceProvider),
  );
}
