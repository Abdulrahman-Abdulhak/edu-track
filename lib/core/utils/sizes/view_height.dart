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
  ViewHeight add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ViewHeight(double.infinity);

    if (val is ViewHeight) return ViewHeight(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewHeight divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ViewHeight(0);

    if (val is ViewHeight) return ViewHeight(value / val.value);
    if (val is num) return ViewHeight(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ViewHeight multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ViewHeight(0);
      if (val.isInfinite) return const ViewHeight(double.infinity);
    }

    if (val is ViewHeight) return ViewHeight(value * val.value);
    if (val is num) return ViewHeight(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ViewHeight subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ViewHeight) return ViewHeight(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }
}
