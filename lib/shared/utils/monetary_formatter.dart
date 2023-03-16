import 'package:intl/intl.dart';

String formatValue(int value) {
  final currencyFormatter =
      NumberFormat.currency(locale: 'en_US', symbol: '\$');

  return currencyFormatter.format(value);
}
