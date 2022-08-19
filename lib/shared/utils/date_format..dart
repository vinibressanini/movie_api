import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime? datetime = DateTime.tryParse(date);

  if (datetime != null) {
    return DateFormat.yMMMd('pt_BR').format(datetime);
  } else {
    return 'Data Desconhecida';
  }
}
