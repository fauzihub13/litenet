import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/presentation/controllers/get_history_device_provider.dart';
import 'package:litenet/features/device/presentation/widgets/history_device_card.dart';
import 'package:litenet/features/promo/presentation/controllers/get_promo_provider.dart';

class HistoryDevicePage extends ConsumerWidget {
  final String deviceId;
  const HistoryDevicePage({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHistory = ref.watch(
      getHistoryDeviceProvider(deviceId: deviceId),
    );

    return Scaffold(
      appBar: CustomAppbar(title: 'Riwayat Topup'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: PaddingSize.vertical),
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(getPromoProvider);
          },
          child: asyncHistory.when(
            data: (data) {
              List<HistoryDeviceDataEntity> historyData = data.data;
              data.data;
              if (historyData.isEmpty) {
                return EmptyState(
                  message: 'Tidak ditemukan data',
                  isRefreshable: true,
                );
              }
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  HistoryDeviceDataEntity history = historyData[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: PaddingSize.horizontal,
                      left: PaddingSize.horizontal,
                      bottom: 16,
                    ),
                    child: HistoryDeviceCard(history: history),
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
    );
  }
}
