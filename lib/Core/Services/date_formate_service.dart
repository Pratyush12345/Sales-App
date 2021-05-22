import 'package:intl/intl.dart';

class DateFormatService {
  static String dateMonthYearString(DateTime val) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    String dateVal = dateFormat.format(val);
    return dateVal;
  }
}
