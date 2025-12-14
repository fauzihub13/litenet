import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/promo_card.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSize.horizontal,
                    left: PaddingSize.horizontal,
                    bottom: 10,
                  ),
                  child: PromoCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
