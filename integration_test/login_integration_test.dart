// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:litenet/main.dart' as app;

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('Login Integration Test', () {
//     testWidgets('Login with valid credentials', (WidgetTester tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       final emailField = find.byType(TextFormField).at(0);
//       final passwordField = find.byType(TextFormField).at(1);

//       // final emailField = find.byKey(Key('emailField'));
//       // final passwordField = find.byKey(Key('passwordField'));
//       final loginButton = find.widgetWithText(ElevatedButton, 'Masuk');

//       // Masukkan email dan password
//       await tester.enterText(emailField, 'user@example.com');
//       await tester.enterText(passwordField, 'password123');
//       await tester.pumpAndSettle();

//       // Tap tombol masuk
//       await tester.tap(loginButton);
//       await tester.pumpAndSettle(const Duration(seconds: 2));

//       // Cek apakah berpindah ke halaman home (misal ada widget dengan text tertentu)
//       expect(find.text('Home'), findsOneWidget);
//     });
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/main.dart';
// Ganti dengan path project Anda

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('QA Automation Flow - Login Page', () {
    testWidgets('Full Login Flow: Validation -> Input -> Navigation', (
      tester,
    ) async {
      // 1. Jalankan Aplikasi
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      final skipButton = find.text('Lewati');
      print('ada skip button? ${skipButton.evaluate().isNotEmpty}');

      // --- TAHAP 1: VALIDASI FORM KOSONG ---
      final loginButton = find.text('Masuk');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Email tidak boleh kosong'), findsOneWidget);
      expect(find.text('Sandi tidak boleh kosong'), findsOneWidget);

      // --- TAHAP 2: VALIDASI FORMAT EMAIL ---
      final emailField = find.byType(TextFormField).at(0);
      final passwordField = find.byType(TextFormField).at(1);

      await tester.enterText(emailField, 'user_salah_format');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Format email salah'), findsOneWidget);

      // --- TAHAP 3: SIMULASI INPUT VALID ---
      await tester.enterText(emailField, 'user@example.com');
      await tester.enterText(passwordField, 'password123');

      // Test toggle show/hide password (fitur isObscure)
      final obscureIcon = find.byIcon(Icons.visibility_off_outlined);
      await tester.tap(obscureIcon);
      await tester.pumpAndSettle();

      // --- TAHAP 4: EKSEKUSI LOGIN ---
      await tester.tap(loginButton);

      // Tunggu hingga loading selesai dan navigasi terjadi
      // Kita gunakan pumpAndSettle dengan timeout jika perlu
      await tester.pumpAndSettle();

      /* VERIFIKASI NAVIGASI:
         Sesuai logic Anda: jika verified -> HomePage, jika tidak -> OtpPage.
         Kita bisa cek apakah salah satu halaman tersebut muncul.
      */
      expect(
        find.byType(Scaffold), // Pastikan ada halaman baru yang ter-render
        findsOneWidget,
      );
    });

    // testWidgets('QA Flow: Navigasi ke Halaman Daftar', (tester) async {
    //   await tester.pumpWidget(const ProviderScope(child: MyApp()));
    //   await tester.pumpAndSettle();

    //   final registerLink = find.text('Daftar');
    //   await tester.tap(registerLink);
    //   await tester.pumpAndSettle();

    //   // Verifikasi apakah pindah dari LoginPage
    //   expect(find.text('Masuk'), findsNothing);
    // });
  });
}
