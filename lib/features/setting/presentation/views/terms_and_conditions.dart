import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'Syarat dan Ketentuan'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PaddingSize.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              title: 'Selamat Datang di LiteNet',
              content:
                  'Dengan menggunakan aplikasi kami, Anda setuju untuk terikat dengan syarat dan ketentuan ini. Mohon baca dengan seksama.',
            ),
            _buildSection(
              context,
              title: '1. Penggunaan Layanan',
              content:
                  'Anda setuju untuk menggunakan layanan kami hanya untuk tujuan yang sah dan sesuai dengan semua hukum dan peraturan yang berlaku. Anda tidak diizinkan menggunakan layanan kami untuk aktivitas ilegal atau yang melanggar hak orang lain.',
            ),
            _buildSection(
              context,
              title: '2. Akun Pengguna',
              content:
                  'Anda bertanggung jawab untuk menjaga kerahasiaan informasi akun Anda, termasuk kata sandi Anda. Anda setuju untuk segera memberitahu kami jika ada penggunaan akun Anda yang tidak sah.',
            ),
            _buildSection(
              context,
              title: '3. Kekayaan Intelektual',
              content:
                  'Semua konten dan materi yang tersedia di aplikasi ini, termasuk namun tidak terbatas pada teks, grafik, logo, dan perangkat lunak, adalah milik LiteNet atau pemberi lisensinya dan dilindungi oleh undang-undang hak cipta.',
            ),
            _buildSection(
              context,
              title: '4. Pembatasan Tanggung Jawab',
              content:
                  'Layanan kami disediakan "sebagaimana adanya" tanpa jaminan apa pun. LiteNet tidak akan bertanggung jawab atas kerusakan tidak langsung, insidental, atau konsekuensial yang timbul dari penggunaan atau ketidakmampuan untuk menggunakan layanan kami.',
            ),
            _buildSection(
              context,
              title: '5. Perubahan Ketentuan',
              content:
                  'Kami berhak untuk mengubah syarat dan ketentuan ini dari waktu ke waktu. Perubahan akan berlaku setelah diposting di halaman ini. Kami menyarankan Anda untuk meninjau halaman ini secara berkala.',
            ),
            _buildSection(
              context,
              title: '6. Hukum yang Mengatur',
              content:
                  'Syarat dan ketentuan ini diatur oleh dan ditafsirkan sesuai dengan hukum yang berlaku di Indonesia.',
            ),
            _buildSection(
              context,
              title: '7. Hubungi Kami',
              content:
                  'Jika Anda memiliki pertanyaan tentang Syarat dan Ketentuan ini, silakan hubungi kami di support@litenet.com.',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: DefaultColors.purple600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: DefaultColors.black200),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
