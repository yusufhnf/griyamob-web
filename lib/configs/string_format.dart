import 'package:griyaadmin/utils/strings.dart';
import 'package:intl/intl.dart';

class StringFormat {
  // HH:mm:ss
  String formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String getHoursOnly(DateTime dateTime) {
    return DateFormat('HH').format(dateTime);
  }

  String getRupiahCurrency(int value) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(value);
  }

  //10 Nov 2020 09:11
  String convertTimeStamp(String dateTime) {
    String day = dateTime.substring(8, 10);
    String month = Strings.getMonthIND(int.parse(dateTime.substring(5, 7)));
    String year = dateTime.substring(0, 4);
    String hour = dateTime.substring(11, 13);
    String minute = dateTime.substring(14, 16);

    return ("$day $month $year\n$hour:$minute");
  }

  String convertPeriode(String periode) {
    String year = periode.substring(0, 4);
    String month = Strings.getMonthIND(int.parse(periode.substring(4, 6)));

    return ("$month $year");
  }
}
