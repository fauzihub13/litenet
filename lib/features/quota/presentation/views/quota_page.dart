import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/quota_card.dart';

class QuotaPage extends ConsumerWidget {
  const QuotaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
    appBar: CustomAppbar(title: 'Pilihan Kuota'),
      body: Column(
        children: [
          // 1. Search Bar
          CustomSearchBar(
            title: "Cari paket kuota",
            onChanged: (value) {},
            onFilterPressed: () {},
          ),

          // 2. List Kuota
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: QuotaCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
