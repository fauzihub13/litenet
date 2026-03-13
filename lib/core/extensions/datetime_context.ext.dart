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

  String toIndonesianDateTimeStringPlus7() {
    // locale 'id' : bahasa Indonesia
    final jakartaTime = this.add(const Duration(hours: 7));
    return DateFormat("d MMMM yyyy HH:mm", "id").format(jakartaTime);
  }
}
