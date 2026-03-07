import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/core/extensions/num_context.ext.dart';
import 'package:litenet/core/extensions/string_context.ext.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/features/order/domain/entities/create_transaction.dart';

class PaymentOrderPage extends HookConsumerWidget {
  final CreateTransactionDataEntity? createTransactionResponse;
  const PaymentOrderPage({super.key, this.createTransactionResponse});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expiredAt = createTransactionResponse!.expiredAt;

    // state awal
    final remaining = useState(
      expiredAt.difference(DateTime.now().toUtc().add(Duration(hours: 7))),
    );

    // timer update
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final diff = expiredAt.difference(
          DateTime.now().toUtc().add(Duration(hours: 7)),
        );
        remaining.value = diff.isNegative ? Duration.zero : diff;
      });
      return timer.cancel;
    }, []);

    // format jam:menit:detik
    String formatDuration(Duration d) {
      final hours = d.inHours.toString().padLeft(2, '0');
      final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
      final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
      return "$hours:$minutes:$seconds";
    }

    return Scaffold(
      appBar: CustomAppbar(title: 'Pembayaran'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: Column(
          children: [
            // 1. KARTU INFORMASI PEMBAYARAN
            Container(
              decoration: BoxDecoration(
                color: DefaultColors.purple500,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header Biru: Bayar Sebelum
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bayar Sebelum",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: DefaultColors.purple50,
                                  ),
                            ),
                            Text(
                              createTransactionResponse?.expiredAt
                                      .toIndonesianDateTimeString() ??
                                  '-',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: DefaultColors.purple50,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: DefaultColors.purple500,
                              ),
                              SizedBox(width: 4),
                              Text(
                                formatDuration(remaining.value),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: DefaultColors.purple500,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Konten Detail Transfer
                  Container(
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transfer ke",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: DefaultColors.purple900,
                              ),
                        ),
                        const SizedBox(height: 12),

                        // Row Bank Logo & Name
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.network(
                                createTransactionResponse?.imageUrl ?? '-',
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
                            const SizedBox(width: 12),
                            Text(
                              "${createTransactionResponse?.bank.firstWordCapitalize()} Virtual Account",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: DefaultColors.purple900,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Field Nomor VA dengan Tombol Copy
                        _buildInfoField(
                          context,
                          value: createTransactionResponse?.vaNumber ?? '-',
                          isCopyable: true,
                        ),

                        const SizedBox(height: 20),
                        Text(
                          "Total Pembayaran",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: DefaultColors.purple900,
                              ),
                        ),
                        const SizedBox(height: 12),

                        // Field Total Nominal
                        _buildInfoField(
                          context,
                          value:
                              createTransactionResponse?.amount.toRupiah() ??
                              'Rp0',
                          isCopyable: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.horizontal,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Button(text: "Periksa Status", onPressed: () {}),
            Button(
              text: "Kembali",
              onPressed: () {},
              backgroundColor: DefaultColors.purple50,
              textColor: DefaultColors.purple500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(
    BuildContext context, {
    required String value,
    required bool isCopyable,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F6F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: DefaultColors.purple900,
            ),
          ),
          if (isCopyable)
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: value));
                context.showSuccess('Nomor VA disalin!');
              },
              child: const Icon(
                Icons.copy_rounded,
                color: DefaultColors.purple200,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
