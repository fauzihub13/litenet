import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/features/device/presentation/views/add_new_device_page.dart';
import 'package:litenet/features/device/presentation/widgets/device_card.dart';

class DeviceListPage extends StatefulWidget {
  const DeviceListPage({super.key});

  @override
  State<DeviceListPage> createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewDevicePage();
              },
            ),
          );
        },
        backgroundColor: DefaultColors.purple50,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: DefaultColors.purple500, size: 30),
      ),
    );
  }
}
