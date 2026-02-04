import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';

class FAQPage extends ConsumerWidget {
  FAQPage({super.key});

  final List<FAQModel> faqs = [
    FAQModel(
      question: "Apa itu LiteNet?",
      answer:
          "LiteNet adalah aplikasi mobile yang digunakan untuk melakukan top up kuota internet satelit, mengelola perangkat terminal, serta memantau penggunaan kuota dan lokasi perangkat secara real-time.",
    ),
    FAQModel(
      question: "Apakah saya bisa memiliki lebih dari satu perangkat?",
      answer:
          "Ya, Anda dapat mendaftarkan dan mengelola beberapa perangkat satelit sekaligus dalam satu akun LiteNet Anda.",
    ),
    FAQModel(
      question:
          "Bagaimana cara menambahkan perangkat satelit ke dalam aplikasi?",
      answer:
          "Anda dapat menekan tombol tambah (+) di halaman daftar perangkat dan mengikuti instruksi pendaftaran terminal yang tertera.",
    ),
    FAQModel(
      question: "Bagaimana cara melakukan top up kuota?",
      answer:
          "Pilih menu 'Pilihan Kuota', tentukan paket yang diinginkan, lalu selesaikan pembayaran melalui metode yang tersedia.",
    ),
    FAQModel(
      question:
          "Berapa lama proses aktivasi kuota setelah pembayaran berhasil?",
      answer:
          "Proses aktivasi biasanya berlangsung instan setelah pembayaran dikonfirmasi, namun dalam beberapa kasus dapat memakan waktu hingga 5-10 menit.",
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'FAQ'),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        itemCount: faqs.length,
        separatorBuilder: (context, index) => Divider(
          color: DefaultColors.purple50.withValues(alpha: 0.5),
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          return Theme(
            // Menghilangkan garis divider bawaan ExpansionTile
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              iconColor: DefaultColors.purple500,
              collapsedIconColor: DefaultColors.purple500,
              title: Text(
                faqs[index].question,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: DefaultColors.purple500,
                  fontWeight: FontWeight.w600,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    faqs[index].answer,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DefaultColors.black200,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FAQModel {
  final String question;
  final String answer;

  FAQModel({required this.question, required this.answer});
}
