import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the screen's width.
class ViewWidth extends UnitSize {
  const ViewWidth(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    final screenWidth = MediaQuery.of(context!).size.width;
    return value * screenWidth / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;

  @override
  ViewWidth add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ViewWidth(double.infinity);

    if (val is ViewWidth) return ViewWidth(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewWidth divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ViewWidth(0);

    if (val is ViewWidth) return ViewWidth(value / val.value);
    if (val is num) return ViewWidth(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ViewWidth multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ViewWidth(0);
      if (val.isInfinite) return const ViewWidth(double.infinity);
    }

    if (val is ViewWidth) return ViewWidth(value * val.value);
    if (val is num) return ViewWidth(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewWidth subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ViewWidth) return ViewWidth(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }
}
