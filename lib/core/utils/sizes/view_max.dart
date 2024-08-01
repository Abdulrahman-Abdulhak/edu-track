import 'dart:math';

import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the maximum value defined in the screen's size.
//* it is either the width or the height.
class ViewMax extends UnitSize {
  const ViewMax(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    final screenSize = MediaQuery.of(context!).size;
    final screenMax = max(screenSize.height, screenSize.width);

    return value * screenMax / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;

  @override
  ViewMax add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ViewMax(double.infinity);

    if (val is ViewMax) return ViewMax(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewMax divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ViewMax(0);

    if (val is ViewMax) return ViewMax(value / val.value);
    if (val is num) return ViewMax(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ViewMax multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ViewMax(0);
      if (val.isInfinite) return const ViewMax(double.infinity);
    }

    if (val is ViewMax) return ViewMax(value * val.value);
    if (val is num) return ViewMax(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewMax subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ViewMax) return ViewMax(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }
}
