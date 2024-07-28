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
  ContainerMin add(Object val) {
    assertMath(val, ContainerMin);

    if (val is ContainerMin) return ContainerMin(value + val.value);
    return ContainerMin(value + (val as num));
  }

  @override
  ContainerMin divide(Object val) {
    assertMath(val, ContainerMin);

    if (val is ContainerMin) return ContainerMin(value / val.value);
    return ContainerMin(value / (val as num));
  }

  @override
  ContainerMin multiply(Object val) {
    assertMath(val, ContainerMin);

    if (val is ContainerMin) return ContainerMin(value * val.value);
    return ContainerMin(value * (val as num));
  }

  @override
  ContainerMin subtract(Object val) {
    assertMath(val, ContainerMin);

    if (val is ContainerMin) return ContainerMin(value - val.value);
    return ContainerMin(value - (val as num));
  }
}
