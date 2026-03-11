import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/constants/variable.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:litenet/features/onboarding/presentation/controllers/onboarding_provider.dart';
import 'package:litenet/routes/app_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id', null);
  final container = ProviderContainer();
  await Future.wait([
    container.read(seenOnboardingProvider.future),
    container.read(userManagerProvider.future),
  ]);
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Variables.appName,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
