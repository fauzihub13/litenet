import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/quota/data/datasources/quota_datasource.dart';
import 'package:litenet/features/quota/data/datasources/transaction_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@Riverpod(keepAlive: true)
QuotaDatasource quotaDatasource(Ref ref) {
  return QuotaDatasourceImpl(httpClient: ref.read(dioProvider));
}

@Riverpod(keepAlive: true)
TransactionDatasource transactionDatasource(Ref ref) {
  return TransactionDatasourceImpl(httpClient: ref.read(dioProvider));
}