import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_modal.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/features/setting/presentation/controllers/logout_provider.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fungsi untuk membuka Email
    Future<void> launchEmail() async {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path:
            'fauziadisaputra3@gmail.com', // Ganti dengan email support LiteNet
        queryParameters: {'subject': 'Bantuan Layanan LiteNet'},
      );

      if (!await launchUrl(emailLaunchUri)) {
        throw Exception('Tidak bisa membuka aplikasi Email');
      }
    }

    // Fungsi untuk membuka WhatsApp
    Future<void> launchWhatsApp() async {
      // Gunakan format internasional tanpa tanda + atau 0 di depan (Contoh: 62812...)
      final String phoneNumber = "6289684781433";
      final String message =
          "Halo Admin LiteNet, saya butuh bantuan terkait perangkat saya.";
      final Uri waUrl = Uri.parse(
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
      );

      if (!await launchUrl(waUrl, mode: LaunchMode.externalApplication)) {
        throw Exception('Tidak bisa membuka WhatsApp');
      }
    }

    ref.listen(logoutProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data != null) {
            context.goNamed(RouteName.loginPage);
          }
        },
        error: (err, _) {
          final error = err as Failure;
          context.showError(error.message ?? 'Terjadi kesalahan');
        },
        loading: () {},
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      // Menggunakan CustomAppbar reusable kita
      appBar: const CustomAppbar(title: "Pengaturan", isLeading: false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // 1. Ikon Dekorasi Tengah (Besar & Transparan)
            Center(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: DefaultColors.purple50.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.icons.setting,
                  width: 60,
                  height: 60,
                  colorFilter: ColorFilter.mode(
                    DefaultColors.purple100,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 2. Daftar Menu Pengaturan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.profile,
                    title: "Ubah Profil",
                    onTap: () {
                      context.pushNamed(RouteName.changeProfilePage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.lock,
                    title: "Ubah Kata Sandi",
                    onTap: () {
                      context.pushNamed(RouteName.changePasswordPage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.faq,
                    title: "FAQ",
                    onTap: () {
                      context.pushNamed(RouteName.faqPage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.info,
                    title: "Kebijakan Privasi",
                    onTap: () {
                      context.pushNamed(RouteName.tncPage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.helpCenter,
                    title: "Kontak Kami",
                    onTap: () {
                      showHelpCenterModal(
                        context: context,
                        onTapEmail: launchEmail,
                        onTapWhatsApp: launchWhatsApp,
                      );
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.logout,
                    title: "Keluar",
                    textColor:
                        DefaultColors.lightRed, // Warna merah untuk keluar
                    iconColor: DefaultColors.lightRed,
                    onTap: () {
                      showLogoutModal(
                        context: context,
                        onTap: () {
                          ref.read(logoutProvider.notifier).logout();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Baris Menu
  Widget _buildSettingItem(
    BuildContext context, {
    required String icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: DefaultColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        leading: SvgPicture.asset(icon, width: 22, height: 22),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor ?? DefaultColors.purple700,
          ),
        ),
        trailing: SvgPicture.asset(
          Assets.icons.arrowForward,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
