import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:litenet/features/order/domain/entities/check_payment_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_payment_status_provider.g.dart';

@riverpod
class CheckPaymentStatus extends _$CheckPaymentStatus {
  @override
  FutureOr<CheckPaymentStatusResponse?> build() async {
    return null;
  }

  Future<void> checkPaymentStatus({required String orderId}) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(checkPaymentStatusUsecaseProvider);
    final result = await usecase.call(orderId: orderId);

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
