import 'dart:math';

import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the maximum value defined in the screen's size.
//* it is either the width or the height.
class ViewMax extends UnitSize {
  const ViewMax(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    assertCompute(context, constraints);

    final screenSize = MediaQuery.of(context!).size;
    final screenMax = max(screenSize.height, screenSize.width);

    return value * screenMax / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;
}
