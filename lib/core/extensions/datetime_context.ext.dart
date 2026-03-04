import 'package:intl/intl.dart';

extension DateTimeFormatID on DateTime {

  String toIndonesianDateString() {
    // locale 'id' : bahasa Indonesia
    return DateFormat("d MMMM yyyy", "id").format(this);
  }
}
