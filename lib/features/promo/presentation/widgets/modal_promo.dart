import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/gen/assets.gen.dart';

void showPromoModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 12,
          top: 12,
        ),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: DefaultColors.purple200,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),

            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Potongan 50% sampai 20K",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.purple900,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: DefaultColors.purple50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: DefaultColors.purple200, width: 1),
              ),
              child: Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _promoDetail(
                    context: context,
                    asset: Assets.icons.money,
                    text: 'Transaksi minimal 100k',
                  ),
                  _promoDetail(
                    context: context,
                    asset: Assets.icons.discount2,
                    text: 'Potongan maksimal 200k',
                  ),
                  _promoDetail(
                    context: context,
                    asset: Assets.icons.calendar,
                    text: 'Berlaku sampai 12 Desember 2025',
                  ),
                ],
              ),
            ),

            Button(
              text: "Salin Kode Promo",
              buttonType: ButtonType.filled,
              onPressed: () {
                context.pop();
              },
            ),
            const SizedBox(height: 20), // Memberikan padding bawah agar aman
          ],
        ),
      );
    },
  );
}

Widget _promoDetail({
  required BuildContext context,
  required String asset,
  required String text,
}) {
  return Row(
    spacing: 6,
    children: [
      SvgPicture.asset(
        asset,
        width: 18,
        height: 18,
        colorFilter: const ColorFilter.mode(
          DefaultColors.purple900,
          BlendMode.srcIn,
        ),
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: DefaultColors.purple900,
          fontSize: 13,
        ),
      ),
    ],
  );
}
