import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/core/widgets/quota_card.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/presentation/controllers/get_all_quota_provider.dart';

class QuotaPage extends HookConsumerWidget {
  const QuotaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuota = ref.watch(getAllQuotaProvider);
    final searchQuery = useState<String>('');

    return Scaffold(
      appBar: CustomAppbar(title: 'Pilihan Kuota', isLeading: true),
      body: Column(
        children: [
          // 1. Search Bar
          CustomSearchBar(
            title: "Cari paket kuota",
            onChanged: (value) {
              searchQuery.value = value;
            },
            onFilterPressed: () {},
          ),

          // 2. List Kuota
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getAllQuotaProvider);
              },
              child: asyncQuota.when(
                data: (data) {
                  final filteredQuota = data.data.where((quota) {
                    final nameLower = quota.name.toLowerCase();
                    final queryLower = searchQuery.value.toLowerCase();
                    return nameLower.contains(queryLower);
                  }).toList();

                  if (filteredQuota.isEmpty) {
                    return EmptyState(
                      message: 'Tidak ada kuota yang ditemukan',
                      isRefreshable: true,
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredQuota.length,
                    itemBuilder: (context, index) {
                      QuotaDataEntity quota = filteredQuota[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingSize.horizontal,
                          left: PaddingSize.horizontal,
                          bottom: 10,
                        ),
                        child: QuotaCard(quota: quota),
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
