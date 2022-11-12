import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    return formatDate(DateTime.now()).microsecondsSinceEpoch ==
        formatDate(this).microsecondsSinceEpoch;
  }

  bool isOverdue() {
    return DateTime.now().microsecondsSinceEpoch >
        formatDate(this).microsecondsSinceEpoch;
  }

  bool isUpcoming() {
    return DateTime.now().microsecondsSinceEpoch <
        formatDate(this).microsecondsSinceEpoch;
  }

  DateTime formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    final formattedDate = DateTime.parse(formatted);
    return formattedDate;
  }
}
