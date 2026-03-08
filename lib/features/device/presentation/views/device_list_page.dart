import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/presentation/controllers/get_all_device_provider.dart';
import 'package:litenet/features/device/presentation/widgets/device_card.dart';
import 'package:litenet/routes/route_name.dart';

class DeviceListPage extends HookConsumerWidget {
  const DeviceListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAllDevice = ref.watch(getAllDeviceProvider);
    final searchQuery = useState('');

    return Scaffold(
      appBar: CustomAppbar(title: 'Daftar Perangkat', isLeading: false),
      body: Column(
        children: [
          // 1. Search Bar (Reusable CustomSearchBar yang kita buat tadi)
          CustomSearchBar(
            title: "Cari perangkat",
            onChanged: (value) {
              searchQuery.value = value;
            },
          ),

          // 2. List Perangkatx
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getAllDeviceProvider);
              },
              child: asyncAllDevice.when(
                data: (data) {
                  final filteredDeviceData = data.data.where((quota) {
                    final nameLower = quota.name.toLowerCase();
                    final queryLower = searchQuery.value.toLowerCase();
                    return nameLower.contains(queryLower);
                  }).toList();

                  // List<DeviceDataEntity> deviceData = data.data;

                  if (filteredDeviceData.isEmpty) {
                    return EmptyState(
                      message: 'Tidak ditemukan data',
                      isRefreshable: true,
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    itemCount: filteredDeviceData.length,
                    itemBuilder: (context, index) {
                      DeviceDataEntity device = filteredDeviceData[index];
                      return DeviceCard(device: device);
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
      // Floating Action Button Tambah (+)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteName.addNewDevicePage);
        },
        backgroundColor: DefaultColors.purple50,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: DefaultColors.purple500, size: 30),
      ),
    );
  }
}
