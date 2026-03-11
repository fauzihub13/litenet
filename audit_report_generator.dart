// ignore_for_file: avoid_print

import 'dart:io';

import 'package:yaml/yaml.dart';

void main() {
  final stopwatch = Stopwatch()..start();
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    print('Error: pubspec.yaml tidak ditemukan.');
    return;
  }

  // 1. Ambil Dependensi dari pubspec
  final yaml = loadYaml(pubspec.readAsStringSync());
  final deps = (yaml['dependencies'] as YamlMap).keys
      .map((e) => e.toString())
      .toList();
  final whitelist = [
    'flutter',
    'dartz',
    'riverpod_annotation',
    'freezed_annotation',
    'intl',
    'json_annotation',
    'meta',
  ];
  final externalPackages = deps
      .where((pkg) => !whitelist.contains(pkg))
      .toList();

  final report = AuditReport();

  // 2. Jalankan Audit per Layer
  _auditLayer(
    name: 'Domain Layer',
    pathSubStr: '/domain/',
    forbiddenPkgs: externalPackages,
    forbiddenImports: [
      '/data/',
      '/presentation/',
      '/core/provider/',
      '/core/widgets/',
    ],
    report: report,
  );

  _auditLayer(
    name: 'Data Layer',
    pathSubStr: '/data/',
    forbiddenPkgs: [
      'go_router',
      'flutter_svg',
      'flutter_map',
      'flutter_hooks',
      'hooks_riverpod',
    ],
    forbiddenImports: ['/presentation/', '/core/widgets/'],
    report: report,
  );

  _auditLayer(
    name: 'Presentation Layer',
    pathSubStr: '/presentation/',
    forbiddenPkgs: [],
    forbiddenImports: ['/data/datasources/', '/data/models/'],
    report: report,
  );

  _auditLayer(
    name: 'Core Layer',
    pathSubStr: '/core/',
    forbiddenPkgs: [],
    forbiddenImports: ['/features/'],
    report: report,
  );

  stopwatch.stop();

  // 3. Simpan Hasil ke TXT
  final output = report.generateFinalString(stopwatch.elapsed);
  File('laporan_audit_arsitektur_litenet.txt').writeAsStringSync(output);

  print('✅ Laporan Audit Berhasil Dibuat!');
  print('📊 Total File Dicek: ${report.totalChecked}');
  print('📄 File: laporan_audit_arsitektur_litenet.txt');
}

void _auditLayer({
  required String name,
  required String pathSubStr,
  required List<String> forbiddenPkgs,
  required List<String> forbiddenImports,
  required AuditReport report,
}) {
  final dir = Directory('lib');
  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.contains(pathSubStr) && f.path.endsWith('.dart'));

  for (final file in files) {
    int violationsInFile = 0;
    final lines = file.readAsLinesSync();

    for (final line in lines) {
      if (!line.startsWith('import ')) continue;

      // Cek Package
      for (final pkg in forbiddenPkgs) {
        if (line.contains("package:$pkg/")) violationsInFile++;
      }

      // Cek Layer
      for (final illegal in forbiddenImports) {
        if (line.contains(illegal)) violationsInFile++;
      }
    }

    report.addResult(name, file.path, violationsInFile);
  }
}

class AuditReport {
  final Map<String, List<FileResult>> data = {};
  int totalChecked = 0;

  void addResult(String layer, String path, int violations) {
    data.putIfAbsent(layer, () => []);
    data[layer]!.add(FileResult(path, violations));
    totalChecked++;
  }

  String generateFinalString(Duration duration) {
    StringBuffer sb = StringBuffer();
    sb.writeln('==========================================================');
    sb.writeln('   LAPORAN EKSAK AUDIT CLEAN ARCHITECTURE - LITENET');
    sb.writeln('==========================================================');
    sb.writeln('Waktu Audit: ${DateTime.now()}');
    sb.writeln('Durasi Scan: ${duration.inMilliseconds} ms');
    sb.writeln('----------------------------------------------------------\n');

    data.forEach((layer, results) {
      final total = results.length;
      final failed = results.where((r) => r.violations > 0).length;
      final success = total - failed;

      sb.writeln('LAYER: $layer');
      sb.writeln('├─ Total Pengecekan: $total file');
      sb.writeln('├─ Sukses (Bersih): $success file');
      sb.writeln('└─ Gagal (Bocor)  : $failed file');

      if (failed > 0) {
        sb.writeln('   DAFTAR PELANGGARAN:');
        for (var r in results.where((r) => r.violations > 0)) {
          sb.writeln('   - ${r.path} (${r.violations} temuan)');
        }
      }
      sb.writeln('');
    });

    sb.writeln('----------------------------------------------------------');
    sb.writeln('KESIMPULAN AKHIR:');
    final grandFail = data.values
        .expand((e) => e)
        .where((r) => r.violations > 0)
        .length;
    if (grandFail == 0) {
      sb.writeln('STATUS: 100% COMPLIANT (Arsitektur Sempurna)');
    } else {
      sb.writeln('STATUS: TERDETEKSI $grandFail KEBOCORAN LAYER');
    }
    sb.writeln('==========================================================');

    return sb.toString();
  }
}

class FileResult {
  final String path;
  final int violations;
  FileResult(this.path, this.violations);
}
