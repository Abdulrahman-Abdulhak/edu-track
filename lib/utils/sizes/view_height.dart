import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the screen's height.
class ViewHeight extends UnitSize {
  const ViewHeight(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    final screenHeight = MediaQuery.of(context!).size.height;
    return value * screenHeight / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;

  @override
  ViewHeight add(Object val) {
    assertMath(val, ViewHeight);

    if (val is ViewHeight) return ViewHeight(value + val.value);
    return ViewHeight(value + (val as num));
  }

  @override
  ViewHeight divide(Object val) {
    assertMath(val, ViewHeight);

    if (val is ViewHeight) return ViewHeight(value / val.value);
    return ViewHeight(value / (val as num));
  }

  @override
  ViewHeight multiply(Object val) {
    assertMath(val, ViewHeight);

    if (val is ViewHeight) return ViewHeight(value * val.value);
    return ViewHeight(value * (val as num));
  }

  @override
  ViewHeight subtract(Object val) {
    assertMath(val, ViewHeight);

    if (val is ViewHeight) return ViewHeight(value - val.value);
    return ViewHeight(value - (val as num));
  }
}
