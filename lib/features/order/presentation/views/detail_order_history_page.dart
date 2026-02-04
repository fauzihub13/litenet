import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/enum.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/gen/assets.gen.dart';

class DetailOrderHistoryPage extends ConsumerWidget {
  final TransactionStatus status;
  const DetailOrderHistoryPage({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppbar(title: 'Detail Pesanan', isRounded: false),
      body: Stack(
        children: [
          // Background Ungu
          Container(
            height: size.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: DefaultColors.purple500,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
          ),

          // Card
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSize.horizontal,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Kartu Putih Detail
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Icon
                      _buildIcon(status: status),
                      const SizedBox(height: 24),
                      Text(
                        "Transaksi Berhasil",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: DefaultColors.purple900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Pembayaran Anda telah diterima dan pesanan sedang diproses. Mohon tunggu beberapa saat hingga kuota aktif pada perangkat Anda.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DefaultColors.black200,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(color: DefaultColors.black50),
                      const SizedBox(height: 24),

                      // Rincian Transaksi
                      _buildDetailRow(
                        context,
                        "Kode Transaksi",
                        "TRX-2193129321",
                      ),
                      _buildDetailRow(context, "Tanggal", "12 Feb 2025, 10:30"),
                      _buildDetailRow(context, "Nominal", "Rp 350.000"),
                      _buildDetailRow(context, "Kuota", "10GB"),
                    ],
                  ),
                ),

                const Spacer(),

                // Tombol Aksi
                Button(
                  text: "Unduh Invoice",
                  buttonType: ButtonType.filled,
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                Button(
                  text: "Kembali",
                  buttonType: ButtonType.outlined,
                  backgroundColor: DefaultColors.purple50,
                  textColor: DefaultColors.purple500,
                  onPressed: () => context.pop(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: DefaultColors.black200),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: DefaultColors.black500,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildIcon({required TransactionStatus status}) {
  Color statusBackgroundColor;
  String iconAsset;

  switch (status) {
    case TransactionStatus.selesai:
      statusBackgroundColor = DefaultColors.purple500;
      iconAsset = Assets.icons.checklist;
      break;
    case TransactionStatus.gagal:
      statusBackgroundColor = DefaultColors.lightRed;
      iconAsset = Assets.icons.cancel;
      break;
    case TransactionStatus.diproses:
      statusBackgroundColor = DefaultColors.lightYellow;
      iconAsset = Assets.icons.loading;
      break;
  }

  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: statusBackgroundColor,
      shape: BoxShape.circle,
      border: Border.all(color: DefaultColors.purple50, width: 12),
    ),
    child: SvgPicture.asset(
      iconAsset,
      width: 40,
      height: 40,
      colorFilter: const ColorFilter.mode(DefaultColors.white, BlendMode.srcIn),
    ),
  );
}
