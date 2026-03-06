import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/core/widgets/quota_card.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:litenet/features/quota/presentation/controllers/get_all_quota_provider.dart';

class QuotaPage extends ConsumerWidget {
  const QuotaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuota = ref.watch(getAllQuotaProvider);

    return Scaffold(
      appBar: CustomAppbar(title: 'Pilihan Kuota', isLeading: true),
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
            child: RefreshIndicator(
              onRefresh: () async{
                ref.invalidate(getAllQuotaProvider);
              },
              child: asyncQuota.when(
                data: (data) {
                  List<QuotaDataEntity> quotaData = data.data;
                  return ListView.builder(
                    itemCount: quotaData.length,
                    itemBuilder: (context, index) {
                      QuotaDataEntity quota = quotaData[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: QuotaCard(
                          quota: quota,
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
