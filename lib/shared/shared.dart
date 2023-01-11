import 'package:intl/intl.dart';

class Shared {
  static String getArabicFormattedDate(DateTime date) {
    return DateFormat.EEEE('ar_IQ')
        .addPattern(',')
        .add_d()
        .add_MMMM()
        .addPattern(',')
        .add_jm()
        .format(date);
  }
}
