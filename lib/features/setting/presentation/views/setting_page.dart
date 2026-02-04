import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_modal.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  @override
  Widget build(BuildContext context) {
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
                      context.goNamed(RouteName.changeProfilePage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.lock,
                    title: "Ubah Kata Sandi",
                    onTap: () {
                      context.goNamed(RouteName.changePasswordPage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.faq,
                    title: "FAQ",
                    onTap: () {
                      context.goNamed(RouteName.faqPage);
                    },
                  ),
                  _buildSettingItem(
                    context,
                    icon: Assets.icons.info,
                    title: "Kebijakan Privasi",
                    onTap: () {
                      context.goNamed(RouteName.tncPage);
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
                      showLogoutModal(context);
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
