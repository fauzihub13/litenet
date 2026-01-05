import 'package:flutter/material.dart';
import 'package:litenet/core/constants/enum.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/features/order/presentation/views/order_history_page.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderHistory order;
  final VoidCallback onTap;

  const OrderHistoryCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusBackgroundColor;
    Color statusTextColor;
    String statusText;

    switch (order.status) {
      case TransactionStatus.selesai:
        statusBackgroundColor = DefaultColors.purple500;
        statusTextColor = DefaultColors.white;
        statusText = "Selesai";
        break;
      case TransactionStatus.gagal:
        statusBackgroundColor = DefaultColors.lightRed;
        statusTextColor = DefaultColors.white;
        statusText = "Gagal";
        break;
      case TransactionStatus.diproses:
        statusBackgroundColor = DefaultColors.lightYellow;
        statusTextColor = DefaultColors.black;
        statusText = "Diproses";
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.trxId,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: DefaultColors.purple500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  order.date,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: DefaultColors.black200,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  order.quota,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: DefaultColors.purple800,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      order.price,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: DefaultColors.purple600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: statusBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        statusText,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: statusTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
