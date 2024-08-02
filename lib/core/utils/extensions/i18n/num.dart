import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

import '../../l10n/l10n.dart';

extension InternationalizedNum on num {
  String toPrise(BuildContext context) {
    final format = NumberFormat.compactSimpleCurrency(
      locale: '${localeOf(context)}',
      decimalDigits: 2,
    );

    return format.format(this);
  }
}
