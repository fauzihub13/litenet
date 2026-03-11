import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('Audit Spesifikasi Clean Architecture LiteNet', () {
    late List<String> externalPackages;

    setUpAll(() {
      final pubspec = File('pubspec.yaml');
      final yaml = loadYaml(pubspec.readAsStringSync());
      final deps = (yaml['dependencies'] as YamlMap).keys
          .map((e) => e.toString())
          .toList();

      // Whitelist: Package yang boleh ada di Domain (Core Logic)
      final whitelist = [
        'flutter',
        'dartz',
        'riverpod_annotation',
        'freezed_annotation',
        'intl',
        'json_annotation',
        'meta',
      ];
      externalPackages = deps.where((pkg) => !whitelist.contains(pkg)).toList();
    });

    test('Audit Layer Domain: Harus Murni Business Logic', () {
      final violations = _scanFiles(
        targetSubFolder: '/domain/',
        forbiddenPackages: externalPackages,
        forbiddenImports: [
          '/data/',
          '/presentation/',
          '/core/provider/',
          '/core/widgets/',
        ],
      );
      expect(
        violations,
        isEmpty,
        reason: 'Kebocoran pada Layer Domain terdeteksi!',
      );
    });

    test('Audit Layer Data: Tidak Boleh Mengandung UI/Router', () {
      final uiPackages = [
        'go_router',
        'flutter_svg',
        'flutter_map',
        'flutter_hooks',
        'hooks_riverpod',
      ];
      final violations = _scanFiles(
        targetSubFolder: '/data/',
        forbiddenPackages: uiPackages,
        forbiddenImports: ['/presentation/', '/core/widgets/'],
      );
      expect(
        violations,
        isEmpty,
        reason: 'Kebocoran UI pada Layer Data terdeteksi!',
      );
    });

    test(
      'Audit Layer Presentation: Dilarang Akses Direct ke DataSource/Model',
      () {
        final violations = _scanFiles(
          targetSubFolder: '/presentation/',
          forbiddenPackages: [], // UI boleh pakai package apa saja
          forbiddenImports: ['/data/datasources/', '/data/models/'],
        );
        expect(
          violations,
          isEmpty,
          reason:
              'Layer Presentation memanggil DataSource/Model secara langsung!',
        );
      },
    );

    test(
      'Audit Core: Tidak Boleh Bergantung pada Features (Circular Dependency)',
      () {
        final violations = _scanFiles(
          targetSubFolder: '/core/',
          forbiddenPackages: [],
          forbiddenImports: ['/features/'],
        );
        expect(
          violations,
          isEmpty,
          reason:
              'Folder Core tidak boleh memanggil file dari folder Features!',
        );
      },
    );
  });
}

List<String> _scanFiles({
  required String targetSubFolder,
  required List<String> forbiddenPackages,
  required List<String> forbiddenImports,
}) {
  final violations = <String>[];
  final libDir = Directory('lib');

  if (!libDir.existsSync()) return [];

  final files = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) => f.path.contains(targetSubFolder) && f.path.endsWith('.dart'),
      );

  for (final file in files) {
    final lines = file.readAsLinesSync();
    for (final line in lines) {
      if (!line.startsWith('import ')) continue;

      // Cek Package Blacklist
      for (final pkg in forbiddenPackages) {
        if (line.contains("package:$pkg/")) {
          violations.add('❌ [Package Leak] ${file.path}: Menggunakan $pkg');
        }
      }

      // Cek Layer Leakage
      for (final illegalPath in forbiddenImports) {
        if (line.contains(illegalPath)) {
          violations.add(
            '⚠️  [Layer Leak] ${file.path}: Mengimport $illegalPath',
          );
        }
      }
    }
  }
  return violations;
}
