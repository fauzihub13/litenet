import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/order/domain/entities/payment_method.dart';
import 'package:litenet/features/order/presentation/controllers/create_transaction_provider.dart';
import 'package:litenet/features/order/presentation/controllers/get_all_payment_method_provider.dart';
import 'package:litenet/routes/route_name.dart';

class PaymentMethodPage extends HookConsumerWidget {
  final String deviceId;
  final String dataPlanId;
  final String promoCode;

  const PaymentMethodPage({
    super.key,
    required this.deviceId,
    required this.dataPlanId,
    required this.promoCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPayment = useState<String>('');
    final asyncPaymentMethod = ref.watch(getAllPaymentMethodProvider);
    final asyncCreateTransaction = ref.watch(createTransactionProvider);

    ref.listen(getAllPaymentMethodProvider, (previous, next) {
      next.when(
        data: (data) {
          selectedPayment.value = data.data.first.code;
        },
        error: (_, __) {},
        loading: () {},
      );
    });

    ref.listen(createTransactionProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data != null) {
            context.pushReplacementNamed(
              RouteName.paymentPage,
              extra: {'orderId': data.data.orderId},
            );
          }
        },
        error: (error, __) {
          // print(error.toString());
          String errorMessage =
              (error as Failure).message ?? 'Terjadi kesalahan';
          context.showError(errorMessage);
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: CustomAppbar(title: 'Metode Pembayaran'),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(getAllPaymentMethodProvider);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize.horizontal,
            vertical: PaddingSize.vertical,
          ),
          child: asyncPaymentMethod.when(
            data: (data) {
              List<PaymentMethodDataEntity> methods = data.data;

              return ListView.builder(
                itemCount: methods.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedPayment.value = methods[index].code;
                    },
                    child: _buildPaymentCard(
                      isSelected: selectedPayment.value == methods[index].code,
                      method: methods[index],
                    ),
                  );
                },
              );
            },
            error: (error, _) {
              String errorMessage =
                  (error as Failure).message ?? 'Terjadi kesalahan';
              return EmptyState(message: errorMessage, isRefreshable: true);
            },
            loading: () {
              return Center(child: const CircularProgressIndicator());
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.horizontal,
        ),
        child: Button(
          text: "Lanjutkan Pembayaran",
          isDisabled: asyncCreateTransaction.isLoading,
          isLoading: asyncCreateTransaction.isLoading,
          onPressed: () {
            if (selectedPayment.value.isNotEmpty) {
              ref
                  .read(createTransactionProvider.notifier)
                  .createTransaction(
                    deviceId: deviceId,
                    dataPlanId: dataPlanId,
                    paymentMethod: selectedPayment.value,
                    promoCode: promoCode,
                  );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPaymentCard({
    required PaymentMethodDataEntity method,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: DefaultColors.black50.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? DefaultColors.purple500 : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo Bank
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              method.imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.monetization_on,
                  color: DefaultColors.purple200,
                  size: 20,
                );
              },
            ),
          ),
          const SizedBox(width: 16),

          // Nama Bank
          Expanded(
            child: Text(
              method.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: DefaultColors.purple900,
              ),
            ),
          ),

          // Custom Radio Indicator
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? DefaultColors.purple500
                    : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: DefaultColors.purple500,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
