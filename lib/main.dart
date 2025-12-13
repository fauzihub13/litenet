import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/constants/variable.dart';
import 'package:litenet/features/onboarding/presentation/views/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Variables.appName,
      theme: AppTheme.light,
      home: OnboardingPage(),
    );
  }
}
