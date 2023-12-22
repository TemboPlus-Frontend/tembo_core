import 'package:intl/intl.dart';

extension DoubleCurrencyExt on num {
  String format() =>
      NumberFormat.currency(decimalDigits: 2, symbol: "TZS ").format(this);
}
