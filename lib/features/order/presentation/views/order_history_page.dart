import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/order/domain/entities/transaction.dart';
import 'package:litenet/features/order/presentation/controllers/get_all_transaction_provider.dart';
import 'package:litenet/features/order/presentation/widgets/order_history_card.dart';
import 'package:litenet/routes/route_name.dart';

class OrderHistoryPage extends HookConsumerWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTransaction = ref.watch(getAllTransactionProvider);
    final selectedStatus = useState<String>('Semua');
    final List<String> categories = ["Semua", "Selesai", "Diproses", "Gagal"];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: const CustomAppbar(title: "Riwayat Pesanan", isLeading: false),
      body: asyncTransaction.when(
        data: (data) {
          List<TransactionDataEntity> transactions = data.data;
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(getAllTransactionProvider);
            },
            child: Column(
              children: [
                // 1. Search Bar Reusable
                CustomSearchBar(title: "Riwayat Pesanan"),

                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: _buildFilterChip(
                          category: categories[index],
                          context: context,
                          isSelected: selectedStatus.value == categories[index],
                        ),
                        onTap: () {
                          selectedStatus.value = categories[index];
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // 3. List Riwayat
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return OrderHistoryCard(
                        order: transactions[index],
                        onTap: () {
                          if (transactions[index].transactionStatus ==
                              'settlement') {
                            context.pushNamed(
                              RouteName.detailOrderHistoryPage,
                              extra: {'orderId': transactions[index].orderId},
                            );
                          } else {
                            context.pushNamed(
                              RouteName.detailOrderHistoryPage,
                              extra: {'orderId': transactions[index].orderId},
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
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
    );
  }

  Widget _buildFilterChip({
    required String category,
    required BuildContext context,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? DefaultColors.purple500 : DefaultColors.purple50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: isSelected ? Colors.white : DefaultColors.purple200,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
