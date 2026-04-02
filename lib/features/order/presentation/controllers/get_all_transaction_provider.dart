import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_transaction_provider.g.dart';

@riverpod
class GetAllTransaction extends _$GetAllTransaction {
  @override
  FutureOr<TransactionResponse?> build() async {
    return null;
  }

  Future<void> fetchAllTransaction() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getAllTransactionUsecaseProvider);
    final result = await usecase.call();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
