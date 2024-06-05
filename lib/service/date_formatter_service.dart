import 'package:intl/intl.dart';

class DateFormatterService {
  static String formatTimestamp(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateFormat formatter = DateFormat('MMM dd yyyy');
    return formatter.format(date);
  }
}
