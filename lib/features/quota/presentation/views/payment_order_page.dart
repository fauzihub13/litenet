import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';

class PaymentOrderPage extends StatefulWidget {
  const PaymentOrderPage({super.key});

  @override
  State<PaymentOrderPage> createState() => _PaymentOrderPageState();
}

class _PaymentOrderPageState extends State<PaymentOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Metode Pembayaran'),
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
                        Text(
                          "Bayar Sebelum",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: DefaultColors.purple50,
                              ),
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
                                "00:12:40",
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
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/1200px-Bank_Mandiri_logo_2016.svg.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "Mandiri Virtual Account",
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
                          value: "9876 8765 8765 5670",
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
                          value: "Rp104.000",
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
        color: const Color(
          0xFFF3F6F9,
        ), // Warna abu-abu sangat muda sesuai gambar
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Nomor VA disalin!")),
                );
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
