import 'package:intl/intl.dart';

extension Stringext on String {
  String formatDate(DateTime date) {
    var locale = 'id_ID';
    var format = DateFormat.yMMMMd(locale);
    String formattedDate = format.format(date);
    return formattedDate;
  }
}

extension FormattedDateString on String? {
  String formatTanggalIndonesia() {
    if (this == null || this!.isEmpty) return "-";

    try {
      final inputFormat = DateFormat('yyyy-MM-dd');
      final dateTime = inputFormat.parse(this!);

      final dayNames = [
        'Senin',
        'Selasa',
        'Rabu',
        'Kamis',
        'Jumat',
        'Sabtu',
        'Minggu',
      ];

      final monthNames = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
      ];

      final dayName = dayNames[dateTime.weekday - 1];
      final day = dateTime.day;
      final monthName = monthNames[dateTime.month - 1];
      final year = dateTime.year;

      return '$dayName, $day $monthName $year';
    } catch (e) {
      return "-";
    }
  }
}

extension DateFormatExtension on String {
  // 'yyyy-MM-dd HH:mm:ss' => 'dd MMMM yyyy, HH:mm'
  String formatTanggalWaktuIndonesia() {
    try {
      // Parsing string ke DateTime
      final dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(this);
      final formattedDate = DateFormat(
        'HH:mm | d MMMM yyyy',
        'id_ID',
      ).format(dateTime);

      return formattedDate;
    } catch (e) {
      return '-';
    }
  }
}
