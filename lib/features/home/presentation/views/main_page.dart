import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/features/device/presentation/views/device_list_page.dart';
import 'package:litenet/features/home/presentation/views/home_page.dart';
import 'package:litenet/features/order/presentation/views/order_history_page.dart';
import 'package:litenet/gen/assets.gen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pageOptions = [
    HomePage(),
    DeviceListPage(),
    OrderHistoryPage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildNavbar(),
      body: _pageOptions.elementAt(_selectedIndex),
    );
  }

  Widget _buildNavbar() {
    return SizedBox(
      height: 90,
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: DefaultColors.white,
        selectedItemColor: DefaultColors.purple500,
        unselectedItemColor: DefaultColors.purple100.withValues(alpha: 0.6),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgIcon(Assets.icons.home, 0),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(Assets.icons.device, 1),
            label: "Perangkat",
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(Assets.icons.order, 2),
            label: "Pesanan",
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(Assets.icons.setting, 3),
            label: "Pengaturan",
          ),
        ],
      ),
    );
  }

  // Fungsi helper untuk mewarnai SVG
  Widget _buildSvgIcon(String assetPath, int index) {
    final isSelected = _selectedIndex == index;
    return SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(
        isSelected
            ? DefaultColors.purple500
            : DefaultColors.purple100.withValues(alpha: 0.6),
        BlendMode.srcIn,
      ),
    );
  }
}
