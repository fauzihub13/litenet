// lib/providers/onboarding_provider.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

final storage = FlutterSecureStorage();

@riverpod
Future<bool> seenOnboarding(Ref ref) async {
  final seen = await storage.read(key: 'seenOnboarding') ?? 'false';
  return seen == 'true';
}
