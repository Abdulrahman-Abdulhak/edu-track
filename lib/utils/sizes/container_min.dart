import 'dart:math';

import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the minimum value defined in the parent widget's
//* size (constraints). it is either the width or the height.
class ContainerMin extends UnitSize {
  const ContainerMin(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final minSize = min(constraints!.minWidth, constraints.minHeight);

    final containerMin = minSize.isFinite ? minSize : screenSize.width;

    return value * containerMin / 100;
  }

  @override
  bool get needsConstraints => true;

  @override
  bool get needsContext => true;

  @override
  ContainerMin add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ContainerMin(double.infinity);

    if (val is ContainerMin) return ContainerMin(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerMin divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ContainerMin(0);

    if (val is ContainerMin) return ContainerMin(value / val.value);
    if (val is num) return ContainerMin(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ContainerMin multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ContainerMin(0);
      if (val.isInfinite) return const ContainerMin(double.infinity);
    }

    if (val is ContainerMin) return ContainerMin(value * val.value);
    if (val is num) return ContainerMin(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerMin subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ContainerMin) return ContainerMin(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }
}
