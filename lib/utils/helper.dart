import 'package:intl/intl.dart';

extension capExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((e) => e.inCaps).join(" ");
}

convertCurrency(int) {
  return NumberFormat.currency(
          locale: 'en_US', name: "Dollar", symbol: '\$', decimalDigits: 0)
      .format(int);
}
