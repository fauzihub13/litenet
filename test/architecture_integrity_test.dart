import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('Audit Eksak Clean Architecture LiteNet', () {
    late List<String> allPackages;

    // Setup: Ambil semua package dari pubspec.yaml
    setUpAll(() {
      final pubspec = File('pubspec.yaml');
      final yaml = loadYaml(pubspec.readAsStringSync());
      allPackages = (yaml['dependencies'] as YamlMap).keys
          .map((e) => e.toString())
          .toList();
    });

    test('1. Isolasi Layer Domain (Murni Bisnis Logic)', () {
      final whitelist = [
        'flutter',
        'dartz',
        'riverpod_annotation',
        'freezed_annotation',
        'intl',
        'json_annotation',
        'meta',
      ];
      final forbiddenInDomain = allPackages
          .where((pkg) => !whitelist.contains(pkg))
          .toList();

      final violations = _checkFolder(
        'lib',
        '/domain/',
        forbiddenInDomain,
        forbiddenPaths: ['/data/', '/presentation/'],
      );

      expect(
        violations,
        isEmpty,
        reason:
            'Layer Domain terkontaminasi package eksternal atau layer lain!',
      );
    });

    test('2. Isolasi Layer Data (Infrastruktur & Persistensi)', () {
      // Data Layer tidak boleh mengandung package UI/Routing
      final forbiddenInData = [
        'go_router',
        'flutter_svg',
        'flutter_map',
        'cupertino_icons',
      ];

      final violations = _checkFolder(
        'lib',
        '/data/',
        forbiddenInData,
        forbiddenPaths: ['/presentation/'],
      );

      expect(
        violations,
        isEmpty,
        reason: 'Layer Data terkontaminasi package UI atau Presentation!',
      );
    });

    test('3. Isolasi Layer Presentation (UI & State Management)', () {
      // Presentation tidak boleh mengimpor DataSource atau Model API secara langsung (harus lewat Entity)
      // Kita cek berdasarkan path folder
      final violations = _checkFolder(
        'lib',
        '/presentation/',
        [],
        forbiddenPaths: ['/data/datasources/', '/data/models/'],
      );

      expect(
        violations,
        isEmpty,
        reason:
            'Layer Presentation memanggil DataSource/Model secara langsung (Leakage)!',
      );
    });
  });
}

/// Fungsi pembantu untuk scan file
List<String> _checkFolder(
  String root,
  String targetFolder,
  List<String> forbiddenPackages, {
  List<String> forbiddenPaths = const [],
}) {
  final violations = <String>[];
  final dir = Directory(root);

  if (!dir.existsSync()) return [];

  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.contains(targetFolder));

  for (final file in files) {
    final content = file.readAsStringSync();

    // Cek Package Ilegal
    for (final pkg in forbiddenPackages) {
      if (content.contains("import 'package:$pkg/")) {
        violations.add(
          'FILE: ${file.path} -> Mengandung package terlarang: $pkg',
        );
      }
    }

    // Cek Import Lintas Layer Ilegal
    for (final path in forbiddenPaths) {
      if (content.contains(path)) {
        violations.add(
          'FILE: ${file.path} -> Melanggar batas layer: mengimport $path',
        );
      }
    }
  }
  return violations;
}
