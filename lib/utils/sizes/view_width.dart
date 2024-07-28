import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the screen's width.
class ViewWidth extends UnitSize {
  const ViewWidth(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    assertCompute(context, constraints);

    final screenWidth = MediaQuery.of(context!).size.width;
    return value * screenWidth / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;

  @override
  ViewWidth add(Object val) {
    assertMath(val, ViewWidth);

    if (val is ViewWidth) return ViewWidth(value + val.value);
    return ViewWidth(value + (val as num));
  }

  @override
  ViewWidth divide(Object val) {
    assertMath(val, ViewWidth);

    if (val is ViewWidth) return ViewWidth(value / val.value);
    return ViewWidth(value / (val as num));
  }

  @override
  ViewWidth multiply(Object val) {
    assertMath(val, ViewWidth);

    if (val is ViewWidth) return ViewWidth(value * val.value);
    return ViewWidth(value * (val as num));
  }

  @override
  ViewWidth subtract(Object val) {
    assertMath(val, ViewWidth);

    if (val is ViewWidth) return ViewWidth(value - val.value);
    return ViewWidth(value - (val as num));
  }
}
