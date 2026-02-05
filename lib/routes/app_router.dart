import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/enum.dart';
import 'package:litenet/features/auth/presentation/views/login_page.dart';
import 'package:litenet/features/auth/presentation/views/register_page.dart';
import 'package:litenet/features/device/presentation/views/add_new_device_page.dart';
import 'package:litenet/features/device/presentation/views/coordinate_device_page.dart';
import 'package:litenet/features/device/presentation/views/detail_device_page.dart';
import 'package:litenet/features/device/presentation/views/device_list_page.dart';
import 'package:litenet/features/home/presentation/views/home_page.dart';
import 'package:litenet/features/home/presentation/views/main_page.dart';
import 'package:litenet/features/onboarding/presentation/controllers/onboarding_provider.dart';
import 'package:litenet/features/onboarding/presentation/views/onboarding_page.dart';
import 'package:litenet/features/order/presentation/views/detail_order_history_page.dart';
import 'package:litenet/features/order/presentation/views/order_history_page.dart';
import 'package:litenet/features/promo/presentation/views/promo_page.dart';
import 'package:litenet/features/quota/presentation/views/detail_quota_page.dart';
import 'package:litenet/features/quota/presentation/views/payment_method.page.dart';
import 'package:litenet/features/quota/presentation/views/payment_order_page.dart';
import 'package:litenet/features/quota/presentation/views/quota_page.dart';
import 'package:litenet/features/setting/presentation/views/change_password_page.dart';
import 'package:litenet/features/setting/presentation/views/change_profile_page.dart';
import 'package:litenet/features/setting/presentation/views/faq_page.dart';
import 'package:litenet/features/setting/presentation/views/setting_page.dart';
import 'package:litenet/features/setting/presentation/views/terms_and_conditions_page.dart';
import 'package:litenet/routes/route_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final seenOnboardingAsync = ref.watch(seenOnboardingProvider);

  // sementara tunggu async selesai → splash
  // if (!seenOnboardingAsync.hasValue) {
  //   return GoRouter(
  //     initialLocation: '/splash',
  //     routes: [
  //       GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
  //     ],
  //   );
  // }

  final seenOnboarding = seenOnboardingAsync.value ?? false;

  return GoRouter(
    debugLogDiagnostics: true,

    initialLocation: seenOnboarding
        ? '/${RouteName.loginPage}'
        : '/${RouteName.onboardingPage}',

    routes: [
      // =====================
      // AUTH & ONBOARDING
      // =====================
      GoRoute(
        path: '/${RouteName.onboardingPage}',
        name: RouteName.onboardingPage,
        builder: (_, __) => const OnboardingPage(),
      ),

      GoRoute(
        path: '/${RouteName.loginPage}',
        name: RouteName.loginPage,
        builder: (_, __) => const LoginPage(),
      ),

      GoRoute(
        path: '/${RouteName.registerPage}',
        name: RouteName.registerPage,
        builder: (_, __) => const RegisterPage(),
      ),

      // -----------------
      // PRODUCT
      // -----------------
      GoRoute(
        path: '/${RouteName.productPage}',
        name: RouteName.productPage,
        builder: (_, __) => const QuotaPage(),

        routes: [
          GoRoute(
            path: RouteName.detailProductPage,
            name: RouteName.detailProductPage,
            builder: (_, __) => const DetailQuotaPage(),
          ),

          GoRoute(
            path: RouteName.paymentMethodPage,
            name: RouteName.paymentMethodPage,
            builder: (_, __) => const PaymentMethodPage(),
          ),

          GoRoute(
            path: RouteName.paymentPage,
            name: RouteName.paymentPage,
            builder: (_, __) => const PaymentOrderPage(),
          ),
        ],
      ),

      // -----------------
      // PROMO
      // -----------------
      GoRoute(
        path: '/${RouteName.promoPage}',
        name: RouteName.promoPage,
        builder: (_, __) => const PromoPage(),
      ),

      GoRoute(
        path: '/${RouteName.changeProfilePage}',
        name: RouteName.changeProfilePage,
        builder: (_, __) => const ChangeProfilePage(),
      ),

      GoRoute(
        path: '/${RouteName.changePasswordPage}',
        name: RouteName.changePasswordPage,
        builder: (_, __) => const ChangePasswordPage(),
      ),

      GoRoute(
        path: "/${RouteName.faqPage}",
        name: RouteName.faqPage,
        builder: (_, __) => FAQPage(),
      ),

      GoRoute(
        path: "/${RouteName.tncPage}",
        name: RouteName.tncPage,
        builder: (_, __) => const TermsAndConditionsPage(),
      ),

      // -----------------
      // DEVICE EXTRA
      // -----------------
      GoRoute(
        path: '/${RouteName.addNewDevicePage}',
        name: RouteName.addNewDevicePage,
        builder: (_, __) => const AddNewDevicePage(),
      ),

      GoRoute(
        path: '/${RouteName.deviceCoordinatePage}',
        name: RouteName.deviceCoordinatePage,
        builder: (_, __) => const CoordinateDevicePage(),
      ),

      GoRoute(
        path: "/${RouteName.detailMonitoringPage}",
        name: RouteName.detailMonitoringPage,
        builder: (_, __) => const DetailDevicePage(),
      ),

      GoRoute(
        path: "/${RouteName.detailOrderHistoryPage}",
        name: RouteName.detailOrderHistoryPage,
        builder: (_, state) {
          final status = state.extra as TransactionStatus;
          return DetailOrderHistoryPage(status: status);
        },
      ),

      // =====================
      // MAIN SHELL
      // =====================
      ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: MainPage(child: child));
        },

        routes: [
          // -----------------
          // HOME
          // -----------------
          GoRoute(
            path: '/${RouteName.homePage}',
            name: RouteName.homePage,
            pageBuilder: (_, __) => NoTransitionPage(child: const HomePage()),
          ),

          // -----------------
          // DEVICE
          // -----------------
          GoRoute(
            path: '/${RouteName.monitoringPage}',
            name: RouteName.monitoringPage,
            pageBuilder: (_, __) =>
                NoTransitionPage(child: const DeviceListPage()),

            routes: [],
          ),

          // -----------------
          // ORDER
          // -----------------
          GoRoute(
            path: '/${RouteName.orderHistoryPage}',
            name: RouteName.orderHistoryPage,
            pageBuilder: (_, __) =>
                NoTransitionPage(child: const OrderHistoryPage()),

            routes: [],
          ),

          // -----------------
          // SETTING
          // -----------------
          GoRoute(
            path: '/${RouteName.settingPage}',
            name: RouteName.settingPage,
            pageBuilder: (_, __) =>
                NoTransitionPage(child: const SettingPage()),
          ),
        ],
      ),
    ],
  );
}
