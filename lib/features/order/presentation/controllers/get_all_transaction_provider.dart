import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_transaction_provider.g.dart';

@riverpod
class GetAllTransaction extends _$GetAllTransaction {
  @override
  FutureOr<TransactionResponse> build() async {
    final usecase = ref.read(getAllTransactionUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
