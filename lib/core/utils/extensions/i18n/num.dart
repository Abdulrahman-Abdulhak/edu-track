import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

import '../../l10n/l10n.dart';

extension FormatedNum on num {
  String toPrise(BuildContext context) {
    final format = NumberFormat.compactSimpleCurrency(
      locale: '${localeOf(context)}',
      decimalDigits: 2,
    );

    return format.format(this);
  }

  String thousandComma(BuildContext context) {
    final format = NumberFormat.decimalPattern('${localeOf(context)}');
    return format.format(this);
  }
}
