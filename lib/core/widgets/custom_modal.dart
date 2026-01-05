import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';

void showLogoutModal(BuildContext context) {
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
            const SizedBox(height: 20),

            Text(
              "Yakin keluar dari akun Anda?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: DefaultColors.purple500,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // Tombol Tidak
                Expanded(
                  child: Button(
                    text: "Tidak",
                    buttonType: ButtonType.filled,
                    backgroundColor: DefaultColors.purple50,
                    textColor: DefaultColors.purple500,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(width: 16),

                // Tombol Ya, Keluar
                Expanded(
                  child: Button(
                    text: "Ya, keluar",
                    buttonType: ButtonType.filled,
                    onPressed: () {
                      // Tambahkan logika logout di sini (clear session, dll)
                      // Contoh: pindah ke halaman login
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Memberikan padding bawah agar aman
          ],
        ),
      );
    },
  );
}
