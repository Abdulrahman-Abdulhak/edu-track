import 'dart:math';

import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the maximum value defined in the parent widget's
//* size (constraints). it is either the width or the height.
class ContainerMax extends UnitSize {
  const ContainerMax(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final maxSize = max(constraints!.maxWidth, constraints.maxHeight);

    final containerMax = maxSize.isFinite ? maxSize : screenSize.width;

    return value * containerMax / 100;
  }

  @override
  bool get needsConstraints => true;

  @override
  bool get needsContext => true;

  @override
  ContainerMax add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ContainerMax(double.infinity);

    if (val is ContainerMax) return ContainerMax(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerMax divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ContainerMax(0);

    if (val is ContainerMax) return ContainerMax(value / val.value);
    if (val is num) return ContainerMax(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ContainerMax multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ContainerMax(0);
      if (val.isInfinite) return const ContainerMax(double.infinity);
    }

    if (val is ContainerMax) return ContainerMax(value * val.value);
    if (val is num) return ContainerMax(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerMax subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ContainerMax) return ContainerMax(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }
}
