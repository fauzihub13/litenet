import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:litenet/routes/route_name.dart';

class MainPage extends ConsumerWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();

    final currentIndex = _getCurrentIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(currentIndex: currentIndex),
    );
  }

  int _getCurrentIndex(String location) {
    if (location.startsWith('/${RouteName.monitoringPage}')) {
      return 1;
    }

    if (location.startsWith('/${RouteName.orderHistoryPage}')) {
      return 2;
    }

    if (location.startsWith('/${RouteName.settingPage}')) {
      return 3;
    }

    return 0; // Home default
  }
}
