import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          switch (index) {
            case 0:
              context.pushNamed(RouteName.homePage);
              break;

            case 1:
              context.pushNamed(RouteName.monitoringPage);
              break;

            case 2:
              context.pushNamed(RouteName.orderHistoryPage);
              break;

            case 3:
              context.pushNamed(RouteName.settingPage);
              break;
          }
        },

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
            icon: _NavIcon(Assets.icons.home, currentIndex == 0),
            label: 'Beranda',
          ),

          BottomNavigationBarItem(
            icon: _NavIcon(Assets.icons.device, currentIndex == 1),
            label: 'Perangkat',
          ),

          BottomNavigationBarItem(
            icon: _NavIcon(Assets.icons.order, currentIndex == 2),
            label: 'Pesanan',
          ),

          BottomNavigationBarItem(
            icon: _NavIcon(Assets.icons.setting, currentIndex == 3),
            label: 'Pengaturan',
          ),
        ],

      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final String asset;
  final bool isSelected;

  const _NavIcon(this.asset, this.isSelected );

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(asset,
    colorFilter: ColorFilter.mode(
        isSelected
            ? DefaultColors.purple500
            : DefaultColors.purple100.withValues(alpha: 0.6),
        BlendMode.srcIn,
      ),
    );
  }
}
