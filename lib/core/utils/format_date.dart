import 'package:intl/intl.dart';

String formatDate(String date) {
  return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
}
