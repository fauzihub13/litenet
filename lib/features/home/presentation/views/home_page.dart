import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/helper/permission.dart';
import 'package:litenet/core/provider/user_manager_provider.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/core/widgets/promo_card.dart';
import 'package:litenet/core/widgets/quota_card.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/presentation/controllers/get_promo_provider.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/presentation/controllers/get_all_quota_provider.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    final latLng = await LocationHelper.initLocation();
    if (latLng != null) {
      print("✅ LatLng: $latLng");
    } else {
      if (mounted) context.showError("Izin lokasi ditolak");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(getCurrentUserProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Header Ungu
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(color: DefaultColors.purple500),
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSize.horizontal,
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Logo LiteNet
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.iconLitenet,
                          width: 22,
                          height: 22,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "LiteNet",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: DefaultColors.purple50,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    userAsync.when(
                      data: (user) => Text(
                        "Halo ${user.name}",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: DefaultColors.purple50,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      loading: () => Text(
                        "Halo ",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: DefaultColors.purple50,
                              fontWeight: FontWeight.bold,
                            ),
                      ), // Muncul loading sebentar
                      error: (err, stack) => Text(
                        "Halo ",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: DefaultColors.purple50,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),

                    Text(
                      "selamat datang kembali!",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: DefaultColors.purple50,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Konten di atas Header (Card Akun Saya)
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  _buildAccountCard(),
                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    title: 'Promo',
                    onTap: () {
                      context.pushNamed(RouteName.promoPage);
                    },
                  ),
                  _buildPromoSlider(),
                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    title: "Kuota",
                    onTap: () {
                      context.pushNamed(RouteName.productPage);
                    },
                  ),
                  _buildQuotaList(),
                  const SizedBox(
                    height: 30,
                  ), // Spasi bawah agar tidak tertutup Navbar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Promo Section
  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Lihat semua",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: DefaultColors.purple500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Account Card
  Widget _buildAccountCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Akun saya",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAccountStat("12", "Perangkat"),
              _buildDivider(),
              _buildAccountStat("100GB", "Sisa Kuota"),
              _buildDivider(),
              _buildAccountStat("60%", "Terpakai"),
            ],
          ),
        ],
      ),
    );
  }

  // Build each account statistic item
  Widget _buildAccountStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: DefaultColors.purple500,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: DefaultColors.black200,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Build divider between account statistics
  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey.withValues(alpha: 0.3),
    );
  }

  // Build Promo Slider
  Widget _buildPromoSlider() {
    final asyncPromo = ref.watch(getPromoProvider);

    return SizedBox(
      height: 130,
      child: asyncPromo.when(
        data: (data) {
          List<PromoDataEntity> promoData = data.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: PaddingSize.horizontal),
            itemCount: promoData.length > 3 ? 3 : promoData.length,
            itemBuilder: (context, index) {
              PromoDataEntity promo = promoData[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: PromoCard(promo: promo, onTap: () {}),
              );
            },
          );
        },
        error: (error, _) {
          String errorMessage =
              (error as Failure).message ?? 'Terjadi kesalahan';
          return EmptyState(message: errorMessage, isRefreshable: true);
        },
        loading: () {
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  // Build Promo Slider
  Widget _buildQuotaList() {
    final asyncQuota = ref.watch(getAllQuotaProvider);

    return asyncQuota.when(
      data: (data) {
        List<QuotaDataEntity> quotaData = data.data;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: quotaData.length > 3 ? 3 : quotaData.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            QuotaDataEntity quota = quotaData[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: QuotaCard(quota: quota),
            );
          },
        );
      },
      error: (error, _) {
        String errorMessage = (error as Failure).message ?? 'Terjadi kesalahan';
        return EmptyState(message: errorMessage, isRefreshable: true);
      },
      loading: () {
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
