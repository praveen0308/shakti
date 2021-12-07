import 'package:intl/intl.dart';

class MyDateFormatter {
  static String convertDate(String inputDate) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date1 = inputFormat.parse(inputDate);

    var outputFormat = DateFormat('MMM dd,yyyy | EEEE');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String getCurrentTime() {
    var date1 = DateTime.now();

    var outputFormat = DateFormat('dd-MM-yyy hh:mm:ss a');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }
}
