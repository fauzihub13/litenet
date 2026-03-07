import 'package:intl/intl.dart';

extension DateTimeFormatID on DateTime {

  String toIndonesianDateString() {
    // locale 'id' : bahasa Indonesia
    return DateFormat("d MMMM yyyy", "id").format(this);
  }

  String toIndonesianDateTimeString() {
    // locale 'id' : bahasa Indonesia
    return DateFormat("d MMMM yyyy hh:mm", "id").format(this);
  }
}
