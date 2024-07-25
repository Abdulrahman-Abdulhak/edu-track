import 'package:edu_track/widgets/text/addons/app_default_text_style.dart';
import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents the last font size set for the current context.
class Em extends UnitSize {
  static var count = 0;
  const Em(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    assertCompute(context, constraints);

    final previousFontSize =
        AppDefaultTextStyle.of(context!).style.fontSize!.compute();

    count++;

    return value * previousFontSize;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;
}
