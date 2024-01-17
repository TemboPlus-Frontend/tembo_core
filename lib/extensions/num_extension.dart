import 'package:intl/intl.dart';

extension DoubleCurrencyExt on num {
  String format({int decimals = 0}) =>
      NumberFormat.currency(decimalDigits: decimals, symbol: "TZS ").format(this);
}
