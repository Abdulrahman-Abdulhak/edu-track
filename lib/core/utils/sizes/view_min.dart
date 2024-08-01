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
  ViewMin add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ViewMin(double.infinity);

    if (val is ViewMin) return ViewMin(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewMin divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ViewMin(0);

    if (val is ViewMin) return ViewMin(value / val.value);
    if (val is num) return ViewMin(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ViewMin multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ViewMin(0);
      if (val.isInfinite) return const ViewMin(double.infinity);
    }

    if (val is ViewMin) return ViewMin(value * val.value);
    if (val is num) return ViewMin(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewMin subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ViewMin) return ViewMin(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }
}
