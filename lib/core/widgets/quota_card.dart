import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_badge.dart';
import 'package:litenet/routes/route_name.dart';

class QuotaCard extends ConsumerWidget {
  const QuotaCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.detailProductPage);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: DefaultColors.purple100.withValues(alpha: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.grid_view_rounded,
                      color: DefaultColors.purple200,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Combo Super",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  "1 BULAN",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "30 GB",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomBadge(text: "25%", fontSize: 14),
                    const SizedBox(width: 8),
                    Text(
                      "Rp420.000",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: DefaultColors.black200,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Rp320.000",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DefaultColors.purple900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Button(
              text: "Beli Sekarang",
              buttonType: ButtonType.outlined,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
