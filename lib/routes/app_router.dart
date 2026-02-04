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
  return GoRouter(
    debugLogDiagnostics: true,

    /// Start page
    initialLocation: '/${RouteName.onboardingPage}',

    routes: [
      // =====================
      // MAIN PAGE
      // =====================
      GoRoute(
        path: '/${RouteName.mainPage}',
        name: RouteName.mainPage,
        builder: (context, state) => const MainPage(),
      ),

      // =====================
      // ONBOARDING
      // =====================
      GoRoute(
        path: '/${RouteName.onboardingPage}',
        name: RouteName.onboardingPage,
        builder: (context, state) => const OnboardingPage(),
      ),

      // =====================
      // AUTH
      // =====================
      GoRoute(
        path: '/${RouteName.loginPage}',
        name: RouteName.loginPage,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: '/${RouteName.registerPage}',
        name: RouteName.registerPage,
        builder: (context, state) => const RegisterPage(),
      ),

      // =====================
      // HOME (ROOT)
      // =====================
      GoRoute(
        path: '/${RouteName.homePage}',
        name: RouteName.homePage,
        builder: (context, state) => const HomePage(),

        routes: [
          // =====================
          // SETTINGS
          // =====================
          GoRoute(
            path: RouteName.settingPage,
            name: RouteName.settingPage,
            builder: (context, state) => const SettingPage(),
          ),

          GoRoute(
            path: RouteName.changeProfilePage,
            name: RouteName.changeProfilePage,
            builder: (context, state) => const ChangeProfilePage(),
          ),

          GoRoute(
            path: RouteName.changePasswordPage,
            name: RouteName.changePasswordPage,
            builder: (context, state) => const ChangePasswordPage(),
          ),

          // =====================
          // FAQ & TNC
          // =====================
          GoRoute(
            path: RouteName.faqPage,
            name: RouteName.faqPage,
            builder: (context, state) => FAQPage(),
          ),

          GoRoute(
            path: RouteName.tncPage,
            name: RouteName.tncPage,
            builder: (context, state) => const TermsAndConditionsPage(),
          ),

          // =====================
          // ORDER
          // =====================
          GoRoute(
            path: RouteName.orderHistoryPage,
            name: RouteName.orderHistoryPage,
            builder: (context, state) => const OrderHistoryPage(),
          ),

          GoRoute(
            path: RouteName.detailOrderHistoryPage,
            name: RouteName.detailOrderHistoryPage,
            builder: (context, state) {
              final status = state.extra as TransactionStatus;
              return DetailOrderHistoryPage(status: status);

            },
          ),

          // =====================
          // PRODUCT
          // =====================
          GoRoute(
            path: RouteName.productPage,
            name: RouteName.productPage,
            builder: (context, state) => const QuotaPage(),
          ),

          GoRoute(
            path: RouteName.detailProductPage,
            name: RouteName.detailProductPage,
            builder: (context, state) {
              return DetailQuotaPage();
            },
          ),

          // =====================
          // PROMO
          // =====================
          GoRoute(
            path: RouteName.promoPage,
            name: RouteName.promoPage,
            builder: (context, state) => const PromoPage(),
          ),

          // =====================
          // DEVICE
          // =====================
          GoRoute(
            path: RouteName.addNewDevicePage,
            name: RouteName.addNewDevicePage,
            builder: (context, state) => const AddNewDevicePage(),
          ),

          GoRoute(
            path: RouteName.deviceCoordinatePage,
            name: RouteName.deviceCoordinatePage,
            builder: (context, state) => const CoordinateDevicePage(),
          ),

          // =====================
          // PAYMENT
          // =====================
          GoRoute(
            path: RouteName.paymentMethodPage,
            name: RouteName.paymentMethodPage,
            builder: (context, state) => const PaymentMethodPage(),
          ),

          GoRoute(
            path: RouteName.paymentPage,
            name: RouteName.paymentPage,
            builder: (context, state) => const PaymentOrderPage(),
          ),

          // =====================
          // MONITORING
          // =====================
          GoRoute(
            path: RouteName.monitoringPage,
            name: RouteName.monitoringPage,
            builder: (context, state) => const DeviceListPage(),
          ),

          GoRoute(
            path: '${RouteName.detailMonitoringPage}',
            name: RouteName.detailMonitoringPage,
            builder: (context, state) {
              return DetailDevicePage();
            },
          ),
        ],
      ),
    ],
  );
}
