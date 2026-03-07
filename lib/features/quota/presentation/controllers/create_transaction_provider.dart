import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/create_transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
class CreateTransaction extends _$CreateTransaction {
  @override
  FutureOr<CreateTransactionResponse?> build() async {
    return null;
  }

  Future<void> createTransaction({
    required String deviceId,
    required String dataPlanId,
    required String paymentMethod,
    required String promoCode,
  }) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(createTransactionUsecaseProvider);
    final result = await usecase.call(
      deviceId: deviceId,
      dataPlanId: dataPlanId,
      paymentMethod: paymentMethod,
      promoCode: promoCode,
    );

    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
