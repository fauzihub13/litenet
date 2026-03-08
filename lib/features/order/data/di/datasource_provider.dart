import 'package:litenet/core/provider/dio_provider.dart';
import 'package:litenet/features/order/data/datasources/transaction_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
TransactionDatasource transactionDatasource(Ref ref) {
  return TransactionDatasourceImpl(httpClient: ref.read(dioProvider));
}
