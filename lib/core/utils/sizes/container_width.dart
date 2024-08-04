import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the parent widget's width.
class ContainerWidth extends UnitSize {
  const ContainerWidth(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final maxWidth = constraints!.maxWidth;

    final containerWidth = maxWidth.isFinite ? maxWidth : screenSize.width;

    return value * containerWidth / 100;
  }

  @override
  bool get needsConstraints => true;

  @override
  bool get needsContext => true;

  @override
  ContainerWidth add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ContainerWidth(double.infinity);

    if (val is ContainerWidth) return ContainerWidth(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerWidth divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ContainerWidth(0);

    if (val is ContainerWidth) return ContainerWidth(value / val.value);
    if (val is num) return ContainerWidth(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ContainerWidth multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ContainerWidth(0);
      if (val.isInfinite) return const ContainerWidth(double.infinity);
    }

    if (val is ContainerWidth) return ContainerWidth(value * val.value);
    if (val is num) return ContainerWidth(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerWidth subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ContainerWidth) return ContainerWidth(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }

  @override
  String toString() {
    return "ContainerWidth($value)";
  }
}
