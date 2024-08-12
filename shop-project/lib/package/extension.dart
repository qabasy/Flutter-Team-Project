// Extensions

import 'package:intl/intl.dart';

extension NewStringExts on String {
  String toName() {
    return toLowerCase().trim();
  }
}

extension NewDoubleExts on double {
  String toMoney({final int frac = 2, final String sign = "\$"}) {
    return NumberFormat.currency(symbol: sign, decimalDigits: frac)
        .format(this);
  }

  String toPercentage() {
    return NumberFormat.percentPattern().format(this);
  }
}
