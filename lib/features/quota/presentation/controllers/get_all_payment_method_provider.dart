import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/payment_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_payment_method_provider.g.dart';

@riverpod
class GetAllPaymentMethod extends _$GetAllPaymentMethod {
  @override
  FutureOr<PaymentMethodResponse> build() async {
    final usecase = ref.read(getAllPaymentMethodUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
