import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/core/extensions/num_context.ext.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';

class PromoCard extends StatelessWidget {
  final PromoDataEntity promo;
  final VoidCallback onTap;
  final List<Color> gradientColors;
  final String backgroundIcon;
  const PromoCard({
    super.key,
    required this.promo,
    required this.onTap,
    required this.backgroundIcon,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 130,
        // Gunakan clipBehavior agar ikon background yang keluar batas otomatis terpotong melengkung
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 1. Dekorasi Lingkaran Putih Transparan (Kanan Atas)
            Positioned(
              top: -40,
              right: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
            ),

            // 2. Ikon Vektor Background (Kanan Bawah, dimiringkan sedikit)
            Positioned(
              right: -20,
              bottom: -20,
              child: SvgPicture.asset(
                backgroundIcon,
                colorFilter: ColorFilter.mode(
                  Colors.white.withValues(alpha: 0.3),
                  BlendMode.srcIn,
                ), // Transparan 10%
              ),
            ),

            // 3. Konten Utama Card
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bagian Atas: Ikon kecil & Badge Teks
                  Row(
                    children: [
                      // Ikon Bulat Kecil
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.local_offer,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Badge Teks
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Sampai ${promo.endAt.toIndonesianDateString()}",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: DefaultColors.white,
                                fontSize: 10,
                              ),
                        ),
                      ),
                    ],
                  ),

                  // Bagian Bawah: Judul & Subjudul
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promo.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: DefaultColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Min. transaksi ${promo.minimumTransaction.toRupiah()}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DefaultColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
