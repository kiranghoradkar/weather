import 'package:intl/intl.dart';

abstract class Utility {
  static String formatDate(String inputDate, String inputFormat, String outputFormat) {
    DateTime tempDate = DateFormat(inputFormat).parse(inputDate);
    final DateFormat formatter = DateFormat(outputFormat);
    return formatter.format(tempDate);
  }
}