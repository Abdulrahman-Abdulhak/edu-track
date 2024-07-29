import 'dart:math';

import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the minimum value defined in the screen's size.
//* it is either the width or the height.
class ViewMin extends UnitSize {
  const ViewMin(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    final screenSize = MediaQuery.of(context!).size;
    final screenMin = min(screenSize.height, screenSize.width);

    return value * screenMin / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;

  @override
  ViewMin add(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
      if (val.isInfinite) return const ViewMin(double.infinity);
    }

    if (val is ViewMin) return ViewMin(value + val.value);
    return ViewMin(value + (val as num));
  }

  @override
  ViewMin divide(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isInfinite) return const ViewMin(0);
    }

    if (val is ViewMin) return ViewMin(value / val.value);
    return ViewMin(value / (val as num));
  }

  @override
  ViewMin multiply(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return const ViewMin(0);
      if (val.isInfinite) return const ViewMin(double.infinity);
    }

    if (val is ViewMin) return ViewMin(value * val.value);
    return ViewMin(value * (val as num));
  }

  @override
  ViewMin subtract(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
    }

    if (val is ViewMin) return ViewMin(value - val.value);
    return ViewMin(value - (val as num));
  }
}
