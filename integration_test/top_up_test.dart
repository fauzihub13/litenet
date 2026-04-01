import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:litenet/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Top Up Kuota flow', (WidgetTester tester) async {
    // Jalankan aplikasi
    app.main();
    await tester.pumpAndSettle();

    // Login dengan akun uji
    print('cari email field');
    // final emailField = find.byType(TextFormField).at(0);
    // final passwordField = find.byType(TextFormField).at(1);
    final emailField = find.byKey(Key('emailField'));
    final passwordField = find.byKey(Key('passwordField'));
    final loginButton = find.byKey(Key('loginButton'));

    await tester.enterText(emailField, 'fauzi@gmail.com');
    await tester.enterText(passwordField, '123455678');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Navigasi ke menu Top Up
    final topUpMenu = find.byKey(Key('topUpMenu'));
    await tester.tap(topUpMenu);
    await tester.pumpAndSettle();

    // Pilih paket kuota 5GB
    final package5GB = find.text('5GB');
    await tester.tap(package5GB);
    await tester.pumpAndSettle();

    // Simulasikan pembayaran berhasil
    final payButton = find.byKey(Key('payButton'));
    await tester.tap(payButton);
    await tester.pumpAndSettle();

    // Verifikasi saldo kuota bertambah
    final quotaBalance = find.byKey(Key('quotaBalance'));
    expect(find.textContaining('5GB'), findsOneWidget);

    // Pastikan ada notifikasi sukses
    final successNotif = find.text('Top Up Berhasil');
    expect(successNotif, findsOneWidget);
  });
}
