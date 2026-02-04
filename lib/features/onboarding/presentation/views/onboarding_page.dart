import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _textPageController = PageController();
  final PageController _imagePageController = PageController();
  int _currentPage = 0;

  // Data Konten Onboarding
  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Tambah dan Kelola Perangkat Satelit",
      "desc":
          "Daftarkan perangkat terminal satelitmu untuk mulai memantau dan mengelola koneksi internet kapan pun, di mana pun.",
      "image": Assets.images.onboarding1.path,
    },
    {
      "title": "Isi Kuota Internet Satelit Secara Praktis",
      "desc":
          "Lakukan top up kuota dengan cepat dan aman melalui berbagai metode pembayaran digital tanpa ribet.",
      "image": Assets.images.onboarding2.path,
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
      body: Stack(
        children: [
          Container(color: DefaultColors.purple500),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Container(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  // Menggunakan ClipRRect agar gambar tetap mengikuti radius container
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: PageView.builder(
                      controller: _imagePageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          onboardingData[index]["image"],
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. Bagian Card Putih
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: DefaultColors.black.withValues(alpha: 0.10),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
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
                        if (_imagePageController.hasClients) {
                          _imagePageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
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
                  Button(
                    onPressed: () {
                      if (_currentPage < onboardingData.length - 1) {
                        _textPageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        context.pushNamed(RouteName.loginPage);
                      }
                    },
                    text: _currentPage == onboardingData.length - 1
                        ? "Mulai Sekarang"
                        : "Selanjutnya",
                  ),
                  const SizedBox(height: 6),
                  // Tombol Lewati (Hanya muncul jika bukan halaman terakhir)
                  _currentPage != onboardingData.length - 1
                      ? Button(
                          onPressed: () {
                            _textPageController.animateToPage(
                              onboardingData.length - 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          text: "Lewati",
                          buttonType: ButtonType.outlined,
                          borderColor: Colors.transparent,
                        )
                      : const SizedBox(height: 50),
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
            ? DefaultColors.purple500
            : DefaultColors.purple500.withValues(alpha: 0.2),
      ),
    );
  }
}

class OnboardingContent extends ConsumerWidget {
  final String title, desc;
  const OnboardingContent({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.2,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: DefaultColors.black200),
          ),
        ],
      ),
    );
  }
}
