import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/core/extensions/num_context.ext.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/gen/assets.gen.dart';

class PromoCard extends StatelessWidget {
  final PromoDataEntity promo;
  final VoidCallback onTap;
  const PromoCard({super.key, required this.promo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 330,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: DefaultColors.purple50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: DefaultColors.purple50.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: DefaultColors.purple50),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.promo,
                    width: 22,
                    height: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Potongan sampai ${promo.maxDiscount.toRupiah()}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Min. transaksi ${promo.minimumTransaction.toRupiah()}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DefaultColors.black200,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Divider(color: DefaultColors.purple50),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: DefaultColors.purple50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Sampai ${promo.endAt.toIndonesianDateString()}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DefaultColors.purple500,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
