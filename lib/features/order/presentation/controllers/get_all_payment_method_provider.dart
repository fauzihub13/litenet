import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_payment_method_provider.g.dart';

@riverpod
class GetAllPaymentMethod extends _$GetAllPaymentMethod {
  @override
  FutureOr<PaymentMethodResponse?> build() async {
    return null;
  }

  Future<void> fetchAllPaymentMethod() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getAllPaymentMethodUsecaseProvider);
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
