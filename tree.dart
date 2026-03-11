// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  final dir = Directory('./lib');
  final outputFile = File('tree.txt');

  String output = 'STRUKTUR ARSITEKTUR PROYEK LITENET (CLEAN ARCHITECTURE)\n';
  output += 'Generated on: ${DateTime.now()}\n';
  output += '==========================================================\n\n';

  output += _getDirectoryStructure(dir, '');

  outputFile.writeAsStringSync(output);
  print('✅ Berhasil! Struktur proyek telah disimpan di: ${outputFile.path}');
}

String _getDirectoryStructure(Directory dir, String indent) {
  String result = '';
  final entities = dir.listSync().toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  // Filter file yang tidak perlu masuk laporan (build files, generator, dll)
  final filteredEntities = entities.where((entity) {
    final name = entity.path.split(Platform.pathSeparator).last;
    return !name.startsWith('.') &&
        !name.contains('.g.dart') &&
        !name.contains('.freezed.dart');
  }).toList();

  for (var i = 0; i < filteredEntities.length; i++) {
    final entity = filteredEntities[i];
    final isLast = i == filteredEntities.length - 1;
    final name = entity.path.split(Platform.pathSeparator).last;

    result += '$indent${isLast ? '└── ' : '├── '}$name\n';

    if (entity is Directory) {
      result += _getDirectoryStructure(
        entity,
        '$indent${isLast ? '    ' : '│   '}',
      );
    }
  }
  return result;
}
