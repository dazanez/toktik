import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double number) {
    final formatter = NumberFormat.compact(locale: "en_US", explicitSign: false);
    return formatter.format(number);
  }
}
