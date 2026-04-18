#!/bin/bash
# Jalankan test dengan coverage
fvm flutter test --coverage

# Buang file generate dan folder UI dari laporan
lcov --remove coverage/lcov.info \
  'lib/**/*.g.dart' \
  'lib/**/*.freezed.dart' \
  'lib/**/views/**' \
  'lib/**/widgets/**' \
  'lib/**/di/**' \
  'lib/core/**' \
  -o coverage/lcov.info

# Generate laporan HTML
genhtml coverage/lcov.info -o coverage/html

# Buka laporan di browser (macOS)
open coverage/html/index.html
