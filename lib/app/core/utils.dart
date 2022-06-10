import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String formatDate(String date, {bool dateOnly = false, required bool splitHour}) {
    DateTime data = DateTime.parse(date);

    // return '${data.day}/${data.month}/${data.year} ${data.hour}:${data.minute}:${data.second}';
    var outputFormat = (dateOnly == true)
        ? DateFormat('dd/MM/yyyy')
        : (splitHour == true)
            ? DateFormat('dd/MM/yyyy\nHH:mm:ss')
            : DateFormat('dd/MM/yyyy HH:mm:ss');
    return outputFormat.format(data);
  }
}
