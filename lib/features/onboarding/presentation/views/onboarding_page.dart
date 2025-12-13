import 'package:flutter/material.dart';
import 'package:litenet/gen/assets.gen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Controller untuk PageView teks (yang utama dan bisa di-swipe pengguna)
  final PageController _textPageController = PageController();
  // Controller untuk PageView gambar (dikontrol secara programatik)
  final PageController _imagePageController = PageController();
  int _currentPage = 0;

  // Data Konten Onboarding
  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Tambah dan Kelola Perangkat Satelit",
      "desc":
          "Daftarkan perangkat terminal satelitmu untuk mulai memantau dan mengelola koneksi internet kapan pun, di mana pun.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Isi Kuota Internet Satelit Secara Praktis",
      "desc":
          "Lakukan top up kuota dengan cepat dan aman melalui berbagai metode pembayaran digital tanpa ribet.",
      "image": Assets.images.icon.path,
    },
    {
      "title": "Monitoring Perangkat dengan mudah",
      "desc":
          "Cek sisa kuota, aktivitas perangkat, dan lokasi sebarannya langsung di peta interaktif hanya dalam satu aplikasi.",
      "image": Assets.images.onboarding3.path,
    },
  ];

  @override
  void dispose() {
    _textPageController.dispose();
    _imagePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B52FF),
      body: Stack(
        children: [
          // 1. Bagian Gambar (Mengikuti PageView)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView.builder(
              controller: _imagePageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    // Menggunakan ClipRRect agar gambar tetap mengikuti radius container
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        onboardingData[index]["image"],
                        fit: BoxFit.cover,
                        // Tambahkan errorBuilder untuk mempermudah debugging
                        errorBuilder: (context, error, stackTrace) {
                          print(error.toString());
                          return const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.white,
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 2. Bagian Card Putih
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: Column(
                children: [
                  // PageView untuk Teks
                  Expanded(
                    child: PageView.builder(
                      controller:
                          _textPageController, // Menggunakan controller teks
                      onPageChanged: (index) {
                        // Sinkronkan PageView gambar saat halaman teks berubah
                        _imagePageController.jumpToPage(index);
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) {
                        return OnboardingContent(
                          title: onboardingData[index]["title"]!,
                          desc: onboardingData[index]["desc"]!,
                        );
                      },
                    ),
                  ),

                  // Indikator Titik
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Tombol Selanjutnya
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < onboardingData.length - 1) {
                          _textPageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          // Aksi Masuk ke Dashboard
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B52FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentPage == onboardingData.length - 1
                            ? "Mulai Sekarang"
                            : "Selanjutnya",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Tombol Lewati (Hanya muncul jika bukan halaman terakhir)
                  SizedBox(
                    height: 50,
                    child: _currentPage != onboardingData.length - 1
                        ? TextButton(
                            onPressed: () {
                              _textPageController.animateToPage(
                                onboardingData.length - 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Text(
                              "Lewati",
                              style: TextStyle(
                                color: Color(0xFF6B52FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(), // Menghilangkan widget
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentPage == index
            ? const Color(0xFF6B52FF)
            : const Color(0xFF6B52FF).withOpacity(0.2),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title, desc;
  const OnboardingContent({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A40),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
        ),
      ],
    );
  }
}
