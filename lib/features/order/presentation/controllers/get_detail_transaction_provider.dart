import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_detail_transaction_provider.g.dart';

@riverpod
class GetDetailTransaction extends _$GetDetailTransaction {
  @override
  FutureOr<DetailTransactionResponse?> build({required String orderId}) async {
    return null;
  }

  Future<void> fetchDetailTransaction(String orderId) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getDetailTransactionUsecaseProvider);
    final result = await usecase.call(orderId: orderId);

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
