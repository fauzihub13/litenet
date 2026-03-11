import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/promo/presentation/widgets/promo_card.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';
import 'package:litenet/features/promo/presentation/controllers/get_promo_provider.dart';
import 'package:litenet/features/promo/presentation/widgets/modal_promo.dart';

class PromoPage extends ConsumerWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPromo = ref.watch(getPromoProvider);

    return Scaffold(
      appBar: CustomAppbar(title: 'Pilihan Promo'),
      body: Column(
        children: [
          // 1. Search Bar
          CustomSearchBar(
            title: "Cari promo",
            onChanged: (value) {},
            onFilterPressed: () {},
          ),

          // 2. List Kuota
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getPromoProvider);
              },
              child: asyncPromo.when(
                data: (data) {
                  List<PromoDataEntity> promoData = data.data;
                  if (promoData.isEmpty) {
                    return EmptyState(
                      message: 'Tidak ditemukan data',
                      isRefreshable: true,
                    );
                  }
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: promoData.length,
                    itemBuilder: (context, index) {
                      PromoDataEntity promo = promoData[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingSize.horizontal,
                          left: PaddingSize.horizontal,
                          bottom: 16,
                        ),
                        child: PromoCard(
                          promo: promo,
                          onTap: () {
                            showPromoModal(context: context, promo: promo);
                          },
                        ),
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
            ),
          ),
        ],
      ),
    );
  }
}
