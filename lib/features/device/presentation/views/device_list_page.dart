import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/features/device/presentation/widgets/device_card.dart';
import 'package:litenet/routes/route_name.dart';

class DeviceListPage extends ConsumerStatefulWidget {
  const DeviceListPage({super.key});

  @override
  ConsumerState<DeviceListPage> createState() => _DeviceListPageState();
}

class _DeviceListPageState extends ConsumerState<DeviceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Daftar Perangkat', isLeading: false),
      body: Column(
        children: [
          // 1. Search Bar (Reusable CustomSearchBar yang kita buat tadi)
          CustomSearchBar(title: "Top up"),

          // 2. List Perangkat
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: 4,
              itemBuilder: (context, index) {
                return DeviceCard();
              },
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
